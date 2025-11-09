{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    kdePackages.kcalc
  ];

  home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop".source = ./convert_to_mp3.desktop;

  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;


}