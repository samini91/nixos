{ pkgs ? import <nixpkgs> { config.allowUnfree = true; }, ... }:

with pkgs; [
  git
  ripgrep
  gnumake
  sshfs
  wget
  apacheKafka
  zookeeper
  zookeeper_mt
  vscode
  wireshark
  #exhibitor
  unzip
]
