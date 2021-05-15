{ pkgs ? import <nixpkgs> {} , ... }:

with pkgs; with nodePackages;
  [
    nodejs
    npm
  ]
  #stuff = with pkgs; with nodePackages; [
  #  nodejs
  #  npm
  #];

