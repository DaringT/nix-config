{ config, pkgs, lib, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";
  
  # 1. Shell Configuration
  # programs.bash.enable = true;
  nixpkgs.config.allowUnfree = true;
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = with pkgs; [
      kdePackages.kate
      kdePackages.elisa
      kdePackages.okular
      kdePackages.qtsvg
      
      wineWowPackages.stable
      thunderbird
      obsidian
      
      # vesktop # discord client
      audacity
      vlc
      mpv
      krename
      makemkv
      virt-manager
      plasma-panel-colorizer
      mkvtoolnix
      remmina
      brave
      spotdl
      yt-dlp
      youtube-tui
      kdePackages.kcalc
      onlyoffice-desktopeditors
      ffmpeg
  ];
  
  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}