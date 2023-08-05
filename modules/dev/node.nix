{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.node;
in
{
  options.modules.dev.node.enable = mkEnableOption "Node";  

  config.environment.systemPackages = mkIf cfg.enable ([
    nodejs_20
    # x2goclient
  ]);
}


