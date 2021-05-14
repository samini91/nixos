{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; with nodePackages; [
    go
    gopls
  ];
}
