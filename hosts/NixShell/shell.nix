{ pkgs ? import <nixpkgs> {} , ... }:

  pkgs.mkShell {
    buildInputs = with pkgs; [      
      which
      htop
      zlib
      firefox
    ] ++ import ../../dev/emacs.nix { };
  }

