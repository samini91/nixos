{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; with haskellPackages; [
    ghc
    ghcid
    stack
    zlib
    postgresql-libpq
    implicit-hie
    ##haskell-language-server
    haskell.packages.ghc883.haskell-language-server ## this for somereason takes forever
  ];
}
