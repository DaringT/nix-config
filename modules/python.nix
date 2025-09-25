{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python313Packages.pip
    python313Packages.venvShellHook
    # python313Packages.pyutube #for downloading YouTube videos
    python313Packages.pyudev
    python313Packages.tqdm
    python313Packages.rich
    python313Packages.requests
    python313Packages.pyqt5

  ];
}
