{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    kdePackages.kcalc
    # makeDesktopItem
    ffmpeg
  ];

  home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop".source = ./convert_to_mp3.desktop;

  # Define the content of the .desktop file in the correct location for KDE/Dolphin Service Menus.

  # home.file."${config.home.homeDirectory}/.local/share/kio/servicemenus/convert_to_mp3.desktop" = {
  #   source = ./convert_to_mp3.desktop;
  # };

  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;


}