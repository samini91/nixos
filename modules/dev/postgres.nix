{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs; [
  postgresql
]
