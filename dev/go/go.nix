{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; with nodePackages; [
    go
    gopls
  ];
}
