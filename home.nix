{ pkgs, ... }:

{
  home.username = "daren";
  home.homeDirectory = "/home/daren";

  # home.stateVersion = "25.05"; # Please rad the comment before changing.

  home.packages = with pkgs; [
    kdePackages.kcalc
    # makeDesktopItem
    ffmpeg
  ];

  # home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop".source = ./convert_to_mp3.desktop;

  # Define the content of the .desktop file in the correct location for KDE/Dolphin Service Menus.

  # home.file."${config.home.homeDirectory}/.local/share/kio/servicemenus/convert_to_mp3.desktop" = {
  #   source = ./convert_to_mp3.desktop;
  # };

  # home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop" = {
  #   text = ''
  #   [Desktop Entry]
  #   Type=Service
  #   ServiceTypes=KonqPopupMenu/Plugin
  #   MimeType=video/*;audio/*;
  #   Icon=audio-mp3
  #   Actions=mp3
  #   X-KDE-Priority=TopLevel
  #   X-KDE-StartupNotify=false
  #   X-KDE-Submenu=Convert


  #   [Desktop Action mp3]
  #   Name=Convert to mp3
  #   Icon=audio-mp3
  #   TryExec=ffmpeg
  #   # Exec=file=%f; ffmpeg -i %f "''${file%.*}.mp3"
  #   Exec=file=%f; ffmpeg -i %f -q:a 0 -n "''${file%.*}.mp3"
  #   '';
  #   enable = true;
  #   executable = true;
  # };

  home.sessionVariables = {
  
  };

  programs.home-manager.enable = true;


}
