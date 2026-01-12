{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;

let serviceCfg = config.modules.services;
    cfg = serviceCfg.jellyfin;
in
{
  options.modules.services.jellyfin.enable = mkEnableOption "Jellyfin";  

  config.services = mkIf cfg.enable {
    jellyfin = {
      enable = true;
      openFirewall = true;
      user="gorgeous";
    };
  };
}


