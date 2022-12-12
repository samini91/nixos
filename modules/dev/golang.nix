{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.golang;
in
{
  options.modules.dev.golang.enable = mkEnableOption "Golang";  

  config.environment.systemPackages = mkIf cfg.enable ([
    go
    gopls
  ]);
}


