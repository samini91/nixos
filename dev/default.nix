{ config, options, pkgs, lib, ... }:
{
  imports = [
    ./haskell.nix
    ./rust.nix
    #./dotnet.nix
    ./nix.nix
    #./octave.nix
  ];
}
