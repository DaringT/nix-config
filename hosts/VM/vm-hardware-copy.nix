# ./modules/vm-hardware-copy.nix
{ config, pkgs, lib, ... }:

let
  sourcePath = "/etc/nixos/hardware-configuration.nix";
  targetPath = "hardware-configuration.nix";
  
  # Note: `builtins.pathExists` checks for the path during evaluation.
  # This script checks existence at *activation* (boot/switch).
in
{
  # Only run this script for the "VM" host if the target file is missing.
  system.activationScripts.copyVmHardwareConfig = lib.mkIf (config.networking.hostName == "VM") ''
    vm_hardware_path=${toString targetPath}
    
    # Check if the target file exists.
    if [ ! -f "$vm_hardware_path" ]; then
      echo "VM hardware config not found at $vm_hardware_path. Copying from ${sourcePath}..."
      
      # Use the 'cp' available in the PATH during activation.
      # The parent directory must exist for this to work.
      # Make sure the directory structure is set up: mkdir -p /hosts/VM
      ${pkgs.coreutils}/bin/cp ${sourcePath} "$vm_hardware_path"
      
      # Important: If you copy the file, you will need to re-run your 
      # NixOS command (e.g., nixos-rebuild) after the first activation
      # so the Nix expression evaluation can pick up the new file on the 
      # next run.
      echo "Copied ${sourcePath} to $vm_hardware_path. A second rebuild may be necessary."
    fi
  '';
}