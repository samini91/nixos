{ system, config, options, pkgs, lib, rust-overlay ,... }:
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
    devCfg = config.modules.dev;
    cfg = devCfg.rust;
in
{
  options.modules.dev.rust.enable = mkEnableOption "Rust";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs; [
    rust-bin.stable.latest.default
    rust-analyzer
  ]);

  # config.environment.systemPackages = with pkgs; [
  #   pkg-config
  #   openssl
  
  # ];
}
