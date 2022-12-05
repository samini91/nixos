{ pkgs ? import <nixpkgs> {} , ... }:
let
   v17 = import
     (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/acc1494a9a510302b4cfbda0d1a31e2057fda969){};
in
with pkgs; with nodePackages; [
  nodejs-16_x
  # npm
]
  #stuff = with pkgs; with nodePackages; [
  #  nodejs
  #  npm
  #];

