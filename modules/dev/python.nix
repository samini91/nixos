{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.python;
in
{
  options.modules.dev.python.enable = mkEnableOption "Python";  

  config.environment.systemPackages = mkIf cfg.enable ([
    python311
    nodePackages_latest.pyright
  ]);
}

