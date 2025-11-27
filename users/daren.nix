{ config, pkgs, lib, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";
  
  # 1. Shell Configuration
  # programs.bash.enable = true;
  nixpkgs.config.allowUnfree = true;
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = with pkgs; [
      kdePackages.elisa
      kdePackages.kate
      kdePackages.okular
      kdePackages.qtsvg
      
      wineWowPackages.stable
      thunderbird
      obsidian
      
      vesktop # discord client
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
      eza
  ];
  # # fonts.fontDir.enable = true;
  # fonts.packages = with pkgs; [
  # # nerd-fonts.fira-code
  
  # ];

  imports = [
    ../modules/home-manager
    ../modules/wm/kde-plasma/dolphin/dolphin.nix
    ../modules/browsers/librewolf.nix
    # ../modules/wm/kde-plasma/plasma-panel.nix
    # ../modules/fonts.nix
  ];
  


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}