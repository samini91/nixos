{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } , ... }:


  pkgs.mkShell {
    buildInputs = with pkgs; [      
      which
      htop
      zlib
      firefox
      vscode
    ] ++ import ../../dev/emacs.nix { };
  }


