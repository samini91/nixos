{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.haskellPackages.ghc
    pkgs.haskellPackages.ghcid
    pkgs.haskellPackages.stack
  ];
}
