{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    python313Packages.pip
    python313Packages.venvShellHook
    python313Packages.pytube #for downloading YouTube videos
    python313Packages.pyudev
    python313Packages.tqdm
    python313Packages.rich

  ];
}
