{ system, config, options, pkgs, lib, rust-overlay ,... }:
let
  #rustPkgs = pkgs { overlays = [ rust-overlay  ]; };
  # rustPkgs = pkgs.overlays = [ rust-overlay ];
  # rustPkgs = pkgs.packages.${system}.extend rust-overlay;
  # fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") { };
  #nixpkgs.overlays = [ rust-overlay ];
  #pkgs.overlays = [ rust-overlay ];
  #overlays = [ (import rust-overlay) ];
  #rustPkgs = import pkgs {
  #  inherit system overlays;
  #};
in {
  config.environment.systemPackages = with pkgs; [
    pkg-config
    openssl
    rust-bin.stable.latest.default
  ];
}
