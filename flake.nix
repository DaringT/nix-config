{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations = {
      DJT-DESKTOP = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./modules/python.nix
          ./hardware-configuration.nix
          # ./modules/librewolf.nix
          home-manager.nixosModules.default
        ];
      };
    };
  };
}