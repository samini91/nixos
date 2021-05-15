{ pkgs ? import <nixpkgs> {}, ... }:

let
  # update this hash for newer versions of unstable stuff
  haskell883 = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/a52e974cff8fb80c427e0d55c01b3b8c770ccec4){};
in 
  with pkgs; with haskellPackages; [
    ghc
    ghcid
    stack
    zlib
    postgresql-libpq
    implicit-hie
    ##haskell-language-server
    #haskell883.haskell.packages.ghc883.haskell-language-server ## this for somereason takes forever
    haskell-language-server
  ]

