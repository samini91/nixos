{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; [
    scala
    sbt
]

