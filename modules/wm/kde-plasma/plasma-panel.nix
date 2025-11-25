{ config, pkgs, lib, ... }:

let
  colorizerWidget = import ./plasma-panel-colorizer.nix { inherit pkgs; };
  # windowTitleAppletPkg = pkgs.callPackage ./plasma-panel-widgets/plasma-window-title-applet.nix {};
in
{
  home.packages = with pkgs; [
    plasma-panel-colorizer
    # windowTitleAppletPkg
  ];

  programs.plasma.panels = [
    {
      # screen = 0;
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
            ];
          };
        }
        {
          digitalClock = {
            date.enable = true;
            # time.showSeconds = "always";
          };
        }
        colorizerWidget
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