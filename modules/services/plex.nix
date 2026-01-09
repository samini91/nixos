{ config, options, pkgs, lib, ... }:

with pkgs;
with lib;
let serviceCfg = config.modules.services;
    cfg = serviceCfg.plex;
in
{
  config.modules.services.plex.enable = mkEnableOption "plex";  

  config.services = mkIf cfg.enable {
    plex.enable = true;
    plex.openFirewall = true;
  };
}



