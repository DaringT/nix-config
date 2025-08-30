{ pkgs, fetchurl, fetchgit, fetchhg }:

{
#   # Override numpy to an older, working version
#   numpy = pkgs.python3Packages.numpy.overrideAttrs (oldAttrs: {
#     version = "1.26.4"; # Or another version known to work, e.g., 1.24.4, 1.25.2
#     src = pkgs.fetchPypi {
#       pname = "numpy";
#       version = "1.26.4";
#       sha256 = "sha256-R4F1p2i+o87M+jWwU+7b0s7gQ+lW0g+x/gQ+d7b+sQ="; # REPLACE WITH ACTUAL SHA256 FOR 1.26.4 (use nix-prefetch-url or find from nixpkgs)

  # Override numpy to an older, working version
  numpy = pkgs.python3Packages.numpy.overrideAttrs (oldAttrs: {
    version = "2.6.2"; # Or another version known to work, e.g., 1.24.4, 1.25.2
    src = pkgs.fetchPypi {
      pname = "numpy";
      version = "1.26.4";
      sha256 = "sha256-R4F1p2i+o87M+jWwU+7b0s7gQ+lW0g+x/gQ+d7b+sQ="; # REPLACE WITH ACTUAL SHA256 FOR 1.26.4 (use nix-prefetch-url or find from nixpkgs)
  };
    };
  );
}


