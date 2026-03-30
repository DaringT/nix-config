{
  # dolphin servicemenu to convert files to mp3
  home.file."/home/daren/.local/share/kio/servicemenus/convert_to_mp3.desktop" = {
  text = ''
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
  Name=Convert to mp3
  Icon=audio-mp3
  TryExec=ffmpeg
  # Exec=file=%f; ffmpeg -i %f "''${file%.*}.mp3"
  Exec=file=%f; ffmpeg -i %f -q:a 0 -n "''${file%.*}.mp3"
  '';
  enable = true;
  executable = true;
  };
}