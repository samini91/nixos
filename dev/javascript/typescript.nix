{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; with nodePackages; [
    nodejs
    npm
  ];
}
