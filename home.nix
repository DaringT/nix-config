{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  # home.stateVersion = "25.05"; # Please rad the comment before changing.

  home.packages = with pkgs; [
    kdePackages.kcalc
    # makeDesktopItem
    # ffmpeg
  ];


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;


}
