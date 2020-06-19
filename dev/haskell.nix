{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.haskellPackages.ghc
    pkgs.haskellPackages.ghcid
    pkgs.haskellPackages.stack
  ];
}
