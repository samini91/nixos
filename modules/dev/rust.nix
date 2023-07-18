{ system, config, options, pkgs, lib, specialArgs, inputs, rust-overlay ,... }:
with lib;
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
  # rustlatest = pkgs.rust-bin.stable.latest.default.override {
  #   extensions = [ "rust-src" ];
  # };
    devCfg = config.modules.dev;
    cfg = devCfg.rust;
in
{
  options.modules.dev.rust.enable = mkEnableOption "Rust";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs; [
    # rustlatest
    # rust-analyzer-unwrapped
    rust-bin.stable.latest.default
    rust-analyzer
    libiconv
    openssl
    openssl.dev
    # problem is that installing this globally will not allow it to find openssl
    # If I open a shell it works tho... 
    pkg-config

  ]);

  # config.environment.systemPackages = with pkgs; [
  #   pkg-config
  #   openssl
  
  # ];
}
