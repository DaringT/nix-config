{ config, pkgs, lib, ... }:

let
vm_hardware_config = import /etc/nixos/hardware-configuration.nix { inherit pkgs; };
# windowTitleAppletPkg = pkgs.callPackage ./plasma-panel-widgets/plasma-window-title-applet.nix {};
in

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
    # kwin-effects-forceblur = {
    #   url = "github:taj-ny/kwin-effects-forceblur";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };     
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      "DJT-DESKTOP" = nixpkgs.lib.nixosSystem {
        inherit system; # Added inherit system for completeness/consistency
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./modules/python.nix
          ./hardware-configuration.nix
          # ./modules/librewolf.nix
          home-manager.nixosModules.default # HM integration for the system
        ];
      };
    nixosConfigurations = {
      "VM" = nixpkgs.lib.nixosSystem {
        inherit system; # Added inherit system for completeness/consistency
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./modules/python.nix
          # ./hardware-configuration.nix
          # ./modules/librewolf.nix
          home-manager.nixosModules.default # HM integration for the system
        ];
        vm_hardware_config
      };
    };
    


    ## 2. Standalone Home Manager Configuration
    #* CMD to run is: 'home-manager switch --flake .#daren'
    homeConfigurations = {
      "daren" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {inherit inputs self;};
        modules = [
          inputs.plasma-manager.homeManagerModules.plasma-manager
          {home.stateVersion = "25.05";}
          ./users/daren.nix
          # modules/home-manager
        ];
      };
    };
  };
}