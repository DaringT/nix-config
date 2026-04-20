{ config, pkgs, lib, ... }:

let
  # colorizerWidget = import ./plasma-panel-colorizer.nix { inherit pkgs; };
  kde-material-you-colors = import ./kde-material-you-colors.nix { inherit pkgs; };
in

{
  home.packages = with pkgs; [
    plasma-panel-colorizer
  ];

  programs.plasma.panels = [
    {
      screen = 0;
      # height = 29;
      location = "bottom";
      # floating = false;
      widgets = [
        { kickoff.icon = "nix-snowflake"; }
        # {
        #   name = "org.kde.windowtitle";
        #   config.General = {
        #     capitalFont = false;
        #     filterActivityInfo = false;
        #     useActivityIcon = false;
        #   };
        # }
        "org.kde.plasma.appmenu"
        "org.kde.plasma.panelspacer"
        "org.kde.plasma.plasmusic-toolbar"
        {
          systemTray.items = {
            hidden = [
              "Clementine" "org.kde.kscreen" "org.kde.kdeconnect"
              "org.kde.plasma.brightness" "org.kde.plasma.cameraindicator"
              "org.kde.plasma.clipboard" "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.keyboardindicator" "org.kde.plasma.manage-inputmethod"
              # "org.kde.plasma.mediacontroller"
            ];
            shown = [
              # "org.kde.plasma.battery"
              "org.kde.plasma.volume"
              "org.kde.plasma.networkmanagement"
              # "org.kde.plasma.bluetooth"
            ];
          };
        }
        {
          digitalClock = {
            date.enable = true;
            # time.showSeconds = "always";
          };
        }
        kde-material-you-colors
        # colorizerWidget
      ];
    }

    {
      # screen = 1;
      # height = 29;
      # widgets = [
      #   "org.kde.plasma.pager"
      # ];
    }
  ];
}