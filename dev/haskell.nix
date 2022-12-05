{ config, options, pkgs, lib, ... }:

with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.haskell;
in {
  options.modules.dev.haskell.enable = mkEnableOption "Haskell";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs; with haskellPackages;[
    ghc
    ghcid
    stack
    zlib
    postgresql-libpq
    implicit-hie
    haskell-language-server
  ]);
}
