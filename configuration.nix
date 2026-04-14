{ config, pkgs, lib, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest kernel.
  boot.kernelModules = [ "sg" ]; # NEEDED FOR MAKEMKV

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Select internationalisation properties.w
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.sddm.autoNumlock = true;
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  
  # Enable Avahi for network discovery if you plan to use .local hostnames
  # and want automatic discovery (though you are adding by hostname manually).
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
  # Enable sound with pipewire.
  services.pulseaudio.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = false;
    # alsa.enable = true;
    # alsa.support32Bit = true;
    # pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
    # wireplumber.enable = true;
  };

  time.timeZone = "America/New_York";  # Set your time zone.


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.daren = {
    isNormalUser = true;
    description = "Daren";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
    ];
  };

  programs.direnv.enable = true;
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  #virtualisation.virtualbox.host.enableExtensionPack = true;

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  #* nix search wget
  environment.systemPackages = with pkgs; [
    wget
    python3
    docker
    git
    fastfetch
    htop
    gh
    vscode
    timeshift
    pulseaudio
    direnv
    home-manager
    bat
    kdePackages.kcolorpicker
    bottles
    dosbox-staging
    ethtool
    winbox4
    unixtools.arp
    xclip

  ];

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # Enable SSH server.
  services.openssh.enable = true;

  # Enabling Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  system.stateVersion = "25.05";

}
