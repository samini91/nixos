{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.scala;
in
{
  options.modules.dev.scala.enable = mkEnableOption "Scala";  

  config.environment.systemPackages = mkIf cfg.enable ([
    scala
    sbt    
  ]);
}

