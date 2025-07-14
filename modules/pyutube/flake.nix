{
  description = "pyutube flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let

  pkgs = nixpkgs.LegacyPackages. "x86_64-linux";
  packageOverrides = pkgs.callPackage ./python-packages.nix {};
  python = pkgs.python3.override { inherit packageOverrides; };

  in {
    devShells.x86_64-linux.default = pkgs.mkShell {

      packages = [
        (python.withPackages(p: [ p.pyutube ]))
      ];

   };
  };
}
