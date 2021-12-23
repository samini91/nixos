{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs; [
  rnix-lsp
]
