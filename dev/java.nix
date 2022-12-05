{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; [
  jdk11
  gradle
]

