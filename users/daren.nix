{ config, pkgs, lib, ... }:
let
  helium-browser = inputs.helium.packages.${pkgs.system}.default;
in
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
      helium-browser
      
  ];


  imports = [
    ../modules/home-manager
    ../modules/wm/kde-plasma/dolphin/dolphin.nix
    ../modules/browsers/librewolf.nix
    ../modules/wm/kde-plasma/plasma-panel.nix
    # ../modules/fonts.nix
    # modules/home-manager/fonts.nix
  ];
  


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}