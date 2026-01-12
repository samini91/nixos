{ config, options, pkgs, lib, ... }:
{
  imports = [
    ./plex.nix
    ./jellyfin.nix
  ];
}
