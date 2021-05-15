{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; [
  python3
  #   ./mycookies/requirements.nix
  #    ./packages.nix
]

