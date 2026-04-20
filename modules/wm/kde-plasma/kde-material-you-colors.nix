{ config, pkgs, ... }:

{
  # Install the package (ensure the package name matches your overlay or nixpkgs)
  home.packages = [
    pkgs.kde-material-you-colors
  ];

  # Systemd service to start the daemon on startup
  systemd.user.services.kde-material-you-colors = {
    Unit = {
      Description = "KDE Material You Colors Daemon";
      After = [ "graphical-session.target" ];
      Partof = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.kde-material-you-colors}/bin/kde-material-you-colors --daemon";
      Restart = "on-failure";
      Environment = "PATH=${pkgs.kde-material-you-colors}/bin";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # Optional: Configuration file setup if the daemon requires specific flags
  # xdg.configFile."kde-material-you-colors/config.conf".text = ''
  #   [Settings]
  #   light_dark=auto
  # '';
}