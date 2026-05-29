{ config, pkgs, lib, ... }:

let
  sharedAliases = import ./aliasis.nix;
in

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 100000;
      save = 100000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };
    

    plugins = [
      {
        name = "zsh-nix-shell";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "sha256-Z6EYQdasvpl1P78poj9efnnLj7QQg13Me8x1Ryyw+dM=";
        };
      }

    ];
      # eval "$(starship init zsh)"

    initContent = ''
      bindkey "^[[3~" delete-char
    '';

    shellAliases = lib.mapAttrs (name: value: lib.mkForce value) sharedAliases;
  };

  programs.starship = {
    enableZshIntegration = true;
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableIonIntegration = false;
    settings = {
      add_newline = true;
      # zstyle ':compleation:*' matcher-list 'm:{a-z}={A-Za-z}'

      format = ''
          $character(bold fg:green)$username$hostname[: ](bold fg:white)$directory(bold fg:blue) 
          [─❯ ](bold fg:red)
      '';
      
      # 󱄅 root: /etc
      # ╰─➤

      character = {
        success_symbol = "[󱄅](bold green)";
        error_symbol = "[󱄅](bold red)";
      };

      username = {
        show_always = true;
        style_user = "bold fg:#ff9000";
        style_root = "bg:white fg:red";
        format = "[$user]($style)";
      };
      directory = {
        format = "[$path]($style)";
        style = "fg:blue";
        truncate_to_repo = false;
      };
      hostname = {  
        ssh_only = true;
        format = "[󱒜](fg:white)[ 🌏 ](bg:black)[$hostname](fg:#FFFFFF)";
        disabled = false;
      };

      directory.substitutions = {
        "Documents" = "󰈙";
        "Downloads" = "󰉍"; #󰇚
        "Music" = "🎜";
        "Pictures" = "󰄀";
        "nix-config" = "󰜗";
      };

    };
  };
   
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };


}