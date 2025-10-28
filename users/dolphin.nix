{ pkgs, ... }:

let
  # The content of the script_convert_to_mp3
  convertScriptContent = ''
    #!${pkgs.bash}/bin/bash

    # Ensure ffmpeg and kdialog are in the path for the script execution environment
    export PATH="${pkgs.lib.makeBinPath [ pkgs.ffmpeg pkgs.kdialog ]}:$PATH"

    #################################################
    ####    MP3 Convertion Script for Dolphin    ####
    #################################################

    echo "args: $@"

    # Check if any arguments were provided
    if [ "$#" -eq 0 ]; then
      echo "Usage: $0 \"/path/to/file 1.m4a\" \"/path/to/file 2.mp3\" ..."
      exit 1
    fi

    echo "--- Processing Files ---"

    for filename in "$@"; do
      # Trim leading/trailing whitespace
      local_filename=$(echo "$filename" | xargs)

      # Skip if the resulting filename is empty.
      if [[ -z "$local_filename" ]]; then
        continue
      fi

      output_filename="${local_filename%.*}.mp3"
      echo "Converting: \"$local_filename\" to \"$output_filename\""

      # -n: Tells ffmpeg NOT to overwrite output files if they already exist.
      ${pkgs.ffmpeg}/bin/ffmpeg -i "$local_filename" -q:a 0 -n "$output_filename"

      # Optional: Add error handling to report conversion status
      if [ $? -eq 0 ]; then
        # Exit code 0 means success
        echo "Successfully converted or skipped: \"$local_filename\""
      elif [ $? -eq 1 ]; then
        # FFmpeg's exit code for "no overwrite" when using -n
        echo "Skipped existing file (not overwritten): \"$output_filename\""
      else
        # Other non-zero exit codes usually indicate an error
        ${pkgs.kdialog}/bin/kdialog --error "Error during conversion of: \"$local_filename\" (FFmpeg exited with code: $?)" >&2
      fi
    done

    # Final passive popup (optional, remove if too intrusive)
    ${pkgs.kdialog}/bin/kdialog --passivepopup "Conversion process complete." 2

    echo "Conversion process complete."
  '';

  # The content of the .desktop file (Service Menu)
  desktopFileContent = ''
    # -*- coding: UTF-8 -*-
    [Desktop Entry]
    Type=Service
    ServiceTypes=KonqPopupMenu/Plugin
    MimeType=video/*;audio/*
    Actions=default_action;
    X-KDE-StartupNotify=false
    X-KDE-Priority=TopLevel
    X-KDE-Submenu=Convert
    Name=Convert to mp3
    Icon=audio-mp3
    Exec=$HOME/.config/dolphin_service_menus_creator/script_convert_to_mp3 %F

    [Desktop Action default_action]
    X-KDE-Priority=TopLevel
    X-KDE-Submenu=Convert
    Name=Convert to mp3
    Icon=audio-mp3
    Exec=$HOME/.config/dolphin_service_menus_creator/script_convert_to_mp3 %F
  '';

in
{
  # 1. Install necessary packages for the script to run correctly in the environment
  # You might already have these globally or in your home.packages.
  home.packages = with pkgs; [
    ffmpeg # For the actual conversion
    kdialog # For the GUI popups/error handling
    # Optional: ensure dolphin is installed if you haven't already
    # dolphin
  ];

  # 2. Place the script file in the expected location and make it executable
  home.file = {
    # The script itself
    "/.config/dolphin_service_menus_creator/script_convert_to_mp3" = {
      source = pkgs.writeText "script_convert_to_mp3" convertScriptContent;
      executable = true;
    };

    # The .desktop file in the KDE Service Menu directory
    ".local/share/kio/servicemenus/convert_to_mp3.desktop" = {
      source = pkgs.writeText "convert_to_mp3.desktop" desktopFileContent;
      # .desktop files do not need executable permission for this purpose
      executable = false;
    };
  };

  # Optional: Reload KDE services to ensure Dolphin picks up the new service menu
  # This is sometimes necessary, but often just restarting Dolphin is enough.
  # This is usually handled by the system or a manual reload.
  # If you need to force a reload, you might look into a script hook, but usually, just rebuilding is fine.
}