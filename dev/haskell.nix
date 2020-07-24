{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskellPackages.ghc
    haskellPackages.ghcid
    haskellPackages.stack
    haskellPackages.zlib
    haskellPackages.postgresql-libpq
  ];
}
