{ config, pkgs, lib, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";
  
  # 1. Shell Configuration
  # programs.bash.enable = true;
  nixpkgs.config.allowUnfree = true;
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = [
      pkgs.kdePackages.elisa
      pkgs.kdePackages.kate
      pkgs.kdePackages.okular
      pkgs.kdePackages.qtsvg

      pkgs.pear-desktop
      pkgs.wineWow64Packages.stable
      pkgs.thunderbird
      pkgs.obsidian
      pkgs.handbrake
      pkgs.vesktop # discord client
      pkgs.audacity
      pkgs.vlc
      pkgs.mpv
      pkgs.krename
      pkgs.makemkv
      pkgs.virt-manager
      pkgs.plasma-panel-colorizer
      pkgs.mkvtoolnix
      pkgs.remmina
      pkgs.brave
      pkgs.spotdl
      pkgs.yt-dlp
      pkgs.youtube-tui
      pkgs.kdePackages.kcalc
      pkgs.onlyoffice-desktopeditors
      pkgs.ffmpeg
      pkgs.eza
      inputs.helium.packages.${pkgs.system}.default
  ];


  imports = [
    ../modules/home-manager
    ../modules/pkgs/dolphin.nix
    ../modules/pkgs/librewolf.nix
    ../modules/pkgs/helium-browser.nix
    ../modules/wm/kde-plasma/plasma-panel.nix

    # ../modules/fonts.nix
    # modules/home-manager/fonts.nix
  ];
  


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;
}