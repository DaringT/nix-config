{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableIonIntegration = false;

    settings = {
      add_newline = true;

      format = ''
        $character(bold fg:green)$username$hostname[: ](bold fg:white)$directory(bold fg:blue) 
        [─❯ ](bold fg:red)
      '';

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
        substitutions = {
          "Documents" = "󰈙";
          "Downloads" = "󰉍";
          "Music" = "🎜";
          "Pictures" = "󰄀";
          "nix-config" = "󰜗";
        };
      };

      hostname = {  
        ssh_only = true;
        format = "[󱒜](fg:white)[ 🌏 ](bg:black)[$hostname](fg:#FFFFFF)";
        disabled = false;
      };
    };
  };
}