{ pkgs ? import <nixpkgs> {} , ... }:
{
  environment.systemPackages = with pkgs; with nodePackages; [
    nodejs
    npm
  ];
}
