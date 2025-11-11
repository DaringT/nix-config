{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    kdePackages.kcalc
    makeDesktopItem
  ];

  # home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop".source = ./convert_to_mp3.desktop;

  # Define the content of the .desktop file in the correct location for KDE/Dolphin Service Menus.
  xdg.configFile."kio/servicemenus/convert_to_mp3.desktop".text = ''
    [Desktop Entry]
    Type=Service
    ServiceTypes=KonqPopupMenu/Plugin
    MimeType=video/*;audio/*;
    Icon=audio-mp3
    Actions=mp3
    X-KDE-Priority=TopLevel
    X-KDE-StartupNotify=false
    X-KDE-Submenu=Convert

    [Desktop Action mp3]
    Name=Convert to mp3 (High Quality)
    Icon=audio-mp3
    # Use pkgs.ffmpeg to ensure the correct path is available at runtime
    TryExec=${pkgs.ffmpeg}/bin/ffmpeg
    # The actual command, enclosed in quotes for the shell interpreter
    Exec=file=%f; ${pkgs.ffmpeg}/bin/ffmpeg -i "%f" -q:a 0 -n "${"file%.*".mp3}"
  '';


  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;


}