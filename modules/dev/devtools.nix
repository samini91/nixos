{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;

let devCfg = config.modules.dev;
    cfg = devCfg.devtools;
in
{
  options.modules.dev.devtools.enable = mkEnableOption "Devtools";  

  config.environment.systemPackages = mkIf cfg.enable ([
    dbeaver
    docker
    google-cloud-sdk
    kubectl
    kubernetes-helm
    minikube
    mongodb-compass
    #postgresql
  ]);
}    

