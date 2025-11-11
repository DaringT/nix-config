{ config, pkgs, lib, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";
  
  # 1. Shell Configuration
  # programs.bash.enable = true;
  
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = with pkgs; [
      # kdePackages.kate
      # kdePackages.elisa
      # kdePackages.okular
      kdePackages.kcalc

      ffmpeg
      
      # wineWowPackages.stable
      # thunderbird
      # obsidian
      onlyoffice-desktopeditors
      
      # vesktop # discord client
      # audacity
      # vlc
      # mpv
      # krename
      # makemkv
      # virt-manager
      # plasma-panel-colorizer
      # mkvtoolnix
      # remmina
      # brave
      # spotdl
      # yt-dlp
      # kdePackages.kate
      # kdePackages.elisa
      # kdePackages.okular
      # kdePackages.qtsvg
      
      # wineWowPackages.stable
      # thunderbird
      # obsidian
  ];
  
  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}