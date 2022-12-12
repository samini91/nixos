{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.octave;
in
{
  options.modules.dev.octave.enable = mkEnableOption "Octave";  

  config.environment.systemPackages = mkIf cfg.enable ([
    octave 
  ]);
}




