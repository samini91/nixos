{ system, config, options, pkgs, lib ,... }:
with lib;
let
      devCfg = config.modules.dev;
      cfg = devCfg.devtools;
in
{
  options.modules.dev.devtools.enable = mkEnableOption "devtools";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs; [
    #rust-bin.stable.latest.default
    #rust-analyzer

    # apacheKafka
    # zookeeper
    # zookeeper_mt
    vscode
    # wireshark
    # exhibitor
    # unzip
    dbeaver-bin
    docker
    google-cloud-sdk
    kubectl
    kubernetes-helm
    minikube
    mongodb-compass
    sqls
    yaml-language-server
    mermaid-cli
    docker-compose
  ]);

}
# with pkgs; [
#   # apacheKafka
#   # zookeeper
#   # zookeeper_mt
#   vscode
#   # wireshark
#   # exhibitor
#   # unzip
#   dbeaver
#   docker
#   google-cloud-sdk
#   kubectl
#   kubernetes-helm
#   minikube
#   mongodb-compass
# ]
