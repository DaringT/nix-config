{ config, pkgs, lib, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
      kdePackages.elisa
      kdePackages.kate
      kdePackages.okular
      kdePackages.qtsvg
      
      pear-desktop
      wineWow64Packages.stable
      thunderbird
      obsidian
      handbrake
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
      # inputs.helium.packages.${system}.default
  ];


  imports = [
    ../modules/home-manager
    ../modules/pkgs/dolphin.nix
    ../modules/pkgs/librewolf.nix
    # ../modules/pkgs/helium-browser.nix
    # ../modules/wm/kde-plasma/plasma-panel.nix
    # ../modules/fonts.nix
  ];
  


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}