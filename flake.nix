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

  outputs = { self, nixpkgs, home-manager }@inputs:
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
          ./modules/librewolf.nix
          home-manager.nixosModules.default # HM integration for the system
        ];
      };
    };


    ## 2. Standalone Home Manager Configuration
    #* CMD to run is: 'home-manager switch --flake .#daren'
    homeConfigurations = {
      "daren" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # configuration = {
        # };
        extraSpecialArgs = {inherit inputs self;};
        modules = [
          {home.stateVersion = "25.05";}
          # ./home.nix
          .users/daren.nix
          # modules/home-manager
        ];
      };
    };
  };
}