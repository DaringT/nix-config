# ./modules/vm-hardware-copy.nix
{ config, pkgs, lib, ... }:

let
  sourcePath = "/etc/nixos/hardware-configuration.nix";
  # CRITICAL FIX: Use the full, correct relative path to the target.
  targetPath = "./hosts/VM/hardware-configuration.nix"; 
in
{
  # Only run this script if the hostname is "VM"
  system.activationScripts.copyVmHardwareConfig = lib.mkIf (config.networking.hostName == "VM") ''
    # Get the path to the current configuration directory (where the flake is).
    # This is necessary because the activation script runs from the temporary 
    # activation directory, not the flake's root.
    NIXOS_CONFIG_DIR=$(dirname $(readlink -f $NIXOS_CONFIG))
    
    # Construct the full absolute path for the target file on the live system.
    # Note the '$NIXOS_CONFIG_DIR/' prefix.
    vm_hardware_path="$NIXOS_CONFIG_DIR/${targetPath}"
    
    # Make sure the target directory exists before attempting the copy.
    mkdir -p $(dirname "$vm_hardware_path")
    
    # Check if the target file exists.
    if [ ! -f "$vm_hardware_path" ]; then
      echo "VM hardware config not found at $vm_hardware_path. Copying from ${sourcePath}..."
      
      # Use the 'cp' available from coreutils.
      # This performs the copy on your *live system's* filesystem.
      ${pkgs.coreutils}/bin/cp ${sourcePath} "$vm_hardware_path"
      
      echo "Copied ${sourcePath} to $vm_hardware_path."
      echo "A second 'nixos-rebuild' is REQUIRED for the configuration to use the new file."
    fi
  '';
}