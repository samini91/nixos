{ config, options, pkgs, lib, ... }:

with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.nix;
in
{
  options.modules.dev.nix.enable = mkEnableOption "Nix";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs;[
    rnix-lsp
  ]);
}

