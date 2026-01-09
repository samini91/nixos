{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;

let serviceCfg = config.modules.services;
    cfg = serviceCfg.plex;
in
{
  options.modules.services.plex.enable = mkEnableOption "Plex";  

  config.services = mkIf cfg.enable {
    plex = {
      enable = true;
      openFirewall = true;
    };
  };
}



