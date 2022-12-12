{ pkgs ? import <nixpkgs> { config.allowUnfree = true; }, ... }:

with pkgs; [
  # apacheKafka
  # zookeeper
  # zookeeper_mt
  vscode
  # wireshark
  # exhibitor
  # unzip
  dbeaver
  docker
  google-cloud-sdk
  kubectl
  kubernetes-helm
  minikube
  mongodb-compass
]
