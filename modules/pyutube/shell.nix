{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell{

  packages = [
    (pkgs.python3.withPackages(p: with p; [
      setuptools
      typer
      requests
      rich
      yaspin
      pytubefix
      inquirer
      termcolor
      moviepy
      # pyutube
    ]))
  ];
}