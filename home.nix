# { config, pkgs, ... }:

# {
#   # Home Manager needs a bit of information about you and the paths it should
#   # manage.
#   home.username = "daren"; # ;
#   home.homeDirectory = "/home/daren"; # ;

#   # This value determines the Home Manager release that your configuration is
#   # compatible with.
#   home.stateVersion = "25.05"; # Please read the comment before changing. # ;

#   # The home.packages option allows you to install Nix packages into your
#   # environment.
#   home.packages = with pkgs: [
#     kdePackages.kcalc
#   ]; # <--- ADDED SEMICOLON HERE

#   home.file = {

#   }; # ;

#   home.sessionVariables = {

#   }; # ;

#   programs.home-manager.enable = true; # ;
# }


{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
  
  ];

  programs.home-manager.enable = true;
}