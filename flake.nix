# let
# vm_hardware_config = import /etc/nixos/hardware-configuration.nix { inherit pkgs; };
# # windowTitleAppletPkg = pkgs.callPackage ./plasma-panel-widgets/plasma-window-title-applet.nix {};
# in

{
  description = "Nixos config flake";
  

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.home-manager.follows = "home-manager";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };     
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, kwin-effects-forceblur}@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Define the path to the hardware configuration file relative to this flake.
    # This is the path checked during Nix evaluation.
    hardwarePath = ./hosts/VM/hardware-configuration.nix;

    # Function to conditionally import a module only if its file exists.
    optionalImport = file:
      if builtins.pathExists file
      then file
      else null;
  in
  {
    # 1. Consolidated NixOS Configurations
    nixosConfigurations = {
      "DJT-DESKTOP" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./modules/pkgs/python.nix
          ./hosts/DJT-DESKTOP/hardware-configuration.nix
          {networking.hostName = "DJT-DESKTOP";}
          home-manager.nixosModules.default # HM integration
        ];
      };

      "VM" = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            
            modules = [
              ./configuration.nix
              
            # 1. NEW: This module runs the script to COPY the file on activation
            # if it's missing on the filesystem.
            ./modules/vm-hardware-copy.nix

            # 2. UPDATED: This line conditionally loads the file if it exists 
            # *during the current evaluation*. If it doesn't exist yet, it's ignored.
            (optionalImport hardwarePath)
                    
                    home-manager.nixosModules.default # HM integration
              ];
            };
          };

    ## 2. Standalone Home Manager Configuration
    #* CMD to run is: 'home-manager switch --flake .#daren'
    homeConfigurations = {
      "daren" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs self;};
        modules = [
          inputs.plasma-manager.homeModules.plasma-manager
          {home.stateVersion = "25.05";}
          ./users/daren.nix
        ];
      };
    };

  }; # <--- CORRECT CLOSING BRACE for the entire 'outputs' attribute set
}