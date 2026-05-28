{ config, pkgs, lib, ... }:

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

    zplug = {
      enable = true;
      plugins = [
          # List fo plugins: https://github.com/unixorn/awesome-zsh-plugins
      # { name = "b4b4r07/enhancd"; } # got some buggy behavior on some servers.
      { name = "chisui/zsh-nix-shell"; } # Makes the nix-shell command be zsh instead of bash.
      { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };


    initContent = ''
      bindkey "^[[3~" delete-char
      eval "$(starship init zsh)"
    '';

    shellAliases = {
      # ls/cat replacements
      lss = lib.mkForce"ls"; # Original 'ls'
      ls = lib.mkForce"lsd";
      ll = lib.mkForce"lsd -alF";
      lll = lib.mkForce"lsd -1";
      # la = "lsd -A";
      la = lib.mkForce "lsd -A";
      l = lib.mkForce"lsd -CF";
      tree = lib.mkForce"lsd --tree";
      cat = "bat";
      iso = "echo dd if=/dev/cdrom of=output.iso";
      
      # Directory/Navigation
      cd = "z";
      cdi = "zi";
      "cd.." = "cd ..";
      nixos = "cd ~/nix-config";
      rn = "mv";

      # Python
      python = "python3";
      py = "python3";

      # Utilities
      "disc-info" = "lsscsi -g";
      cls = "clear";
      ipa = "hostname -I | awk '{print $1}'";

      # External Programs & Nix Management
      yt = "yt-dlp --cookies yt-cookies.txt -t mp3";
      hms = "home-manager switch --flake ~/nix-config#daren";
      nrs = "cd ~/nix-config && sudo nixos-rebuild switch --flake .#DJT-DESKTOP";
      nit = "cd ~/nix-config && git add -A && git commit -m";
      
      # Grep Colors
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      cb = "xclip -sel clip";
      # # Alert Alias (using multiline string)
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableIonIntegration = false;
    enableZshIntegration = false;
    settings = {
      add_newline = true;
      # format = ''
      #     [](green)[ ](bg:green fg:black)$username$hostname[](bg:blue fg:blue)$directory[](blue) 
      #     $character
      # '';

      # zstyle ':compleation:*' matcher-list 'm:{a-z}={A-Za-z}'

      format = ''
          $character(bold fg:green)$username$hostname[: ](bold fg:white)$directory(bold fg:blue) 
          [─❯ ](bold fg:red)
      '';
            # $username[󱒜](bold fg:#FFFFFF)$hostname[:](fg:#FFFFFF)$directory[ 󰁔](fg:#FF0000)
      
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
      # };
      # character = {
      #   success_symbol = "[  ❯](bold green)";
      #   error_symbol = "[  ❯](bold red)";
      };
      #  ⮕

      directory.substitutions = {
        "Documents" = "󰈙";
        "Downloads" = "󰉍"; #󰇚
        "Music" = "🎜";
        "Pictures" = "󰄀";
        "nix-config" = "󰜗";
      };

    };
  };
  ###
# Zoxide
###
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };


}