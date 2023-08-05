{ config, options, pkgs, lib, ... }:
{
  imports = [
    ./haskell.nix
    ./rust.nix
    ./dotnet.nix
    ./nix.nix
    ./golang.nix
    ./java.nix
    ./octave.nix
    ./python.nix
    ./scala.nix
    ./node.nix
    ./ruby.nix
    ./devtools.nix
  ];
}
