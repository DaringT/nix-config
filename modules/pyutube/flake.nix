{
  description = "flake"; 
  
  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  }; 
 
  outputs = { self, nixpkgs, ... }: let 
 
    pkgs = nixpkgs.legacyPackages."x86_64-linux"; 
    packageOverrides = pkgs.callPackage ./python-packages.nix {}; 
    python = pkgs.python3.override { inherit packageOverrides; };
  
  in { 
    devShells.x86_64-linux.default = pkgs.mkShell { 
      
      packages = [
        (python.withPackages(p: [ p.requests ])) 
      ];
    
    };
    
    # 🌟 Add this 'packages' output
    packages.x86_64-linux.default = python.withPackages(p: [ p.requests ]); 
  };
}