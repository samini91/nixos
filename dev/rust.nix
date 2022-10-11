{ pkgs ? import <nixpkgs> {}, ... }:
let
  fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") { };
in
with pkgs; [
    fenix.stable.toolchain
    pkg-config
    openssl
  ]

