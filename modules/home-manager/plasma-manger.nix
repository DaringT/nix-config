{ config, pkgs, ... }:

{
  # 1. Ensure the 'flac' encoder is installed
  home.packages = with pkgs; [
    flac  # The package containing the 'flac' executable
  ];

  # 2. Define the Service Menu Script (The actual logic)
  home.file.".local/bin/script_Convert to flac" = {
    # Set it as executable
    executable = true;
    # Place the script content here
    text = ''
      #!${pkgs.bash}/bin/bash

      for file in "$@"; do
          # Strip the extension to create the new filename
          filename=$(basename -- "$file")
          extension="${filename##*.}"
          filename="${filename%.*}"

          # Use the 'flac' encoder (ensure the full path is used)
          # -s: Silent mode
          # -f: Force overwrite (optional, you might want to remove this)
          # -o: Output file
          ${pkgs.flac}/bin/flac -s -f "$file" -o "$(dirname "$file")/${filename}.flac"

          # Optional: Delete the original file after successful conversion
          # rm "$file"
      done
    '';
  };

  # 3. Define the Dolphin Context Menu Entry (The .desktop file)
  # Location for KDE Service Menus (Plasma 5/6)
  home.file.".local/share/kservices5/ServiceMenus/Convert to flac.desktop" = {
    # Place the .desktop file content here
    text = ''
      [Desktop Entry]
      Type=Service
      MimeType=audio/mpeg;audio/x-flac;
      Actions=ConvertToFLAC
      X-KDE-Priority=TopLevel

      [Desktop Action ConvertToFLAC]
      Name=Convert to FLAC
      Icon=audio-x-flac
      # %F is the list of files selected, which are passed to the script
      Exec=${config.home.homeDirectory}/.local/bin/script_Convert to flac %F
    '';
  };
}