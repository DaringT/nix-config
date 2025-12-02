{ config, lib, pkgs, ... }:

let
  # Define the absolute paths on the target filesystem
  targetDir = "$HOME/nix-config/hosts/VM";
  targetFile = "${targetDir}/hardware-configuration.nix";
  sourceFile = "/etc/nixos/hardware-configuration.nix";
in
{
  # Activation scripts run during the switch/boot process (usually as root)
  system.activationScripts.copyHardwareConfig = ''
    echo "NixOS Activation: Checking for required hardware configuration file."

    TARGET_DIR="${targetDir}"
    TARGET_FILE="${targetFile}"
    SOURCE_FILE="${sourceFile}"

    # 1. Create the target directory if it doesn't exist
    if [ ! -d "$TARGET_DIR" ]; then
      echo "Creating directory $TARGET_DIR..."
      mkdir -p "$TARGET_DIR" || (echo "Warning: Could not create directory $TARGET_DIR. Check permissions." >&2)
    fi

    # 2. Check if the target hardware file exists
    if [ ! -f "$TARGET_FILE" ]; then
      echo "Target hardware file $TARGET_FILE not found."

      # 3. If the target is missing, check the source file and copy it
      if [ -f "$SOURCE_FILE" ]; then
        cp "$SOURCE_FILE" "$TARGET_FILE"
        echo "--> SUCCESS: Copied $SOURCE_FILE to $TARGET_FILE."
      
        # Set ownership (assuming 'user' is the intended owner)
        chown -R user:users "$TARGET_DIR" 2>/dev/null || true
        
        echo "--------------------------------------------------------"
        echo "A new 'hardware-configuration.nix' has been created."
        echo "A SECOND 'nixos-rebuild switch' IS REQUIRED to load it."
        echo "--------------------------------------------------------"
      else
        echo "--> ERROR: Source file $SOURCE_FILE not found. Cannot initialize configuration." >&2
      fi
    else
      echo "Target file $TARGET_FILE already exists. Skipping copy."
    fi
  '';
}