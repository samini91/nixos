{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.java;
in
{
  options.modules.dev.java.enable = mkEnableOption "Java";  

  config.environment.systemPackages = mkIf cfg.enable ([
    jdk17
    gradle
  ]);
}
