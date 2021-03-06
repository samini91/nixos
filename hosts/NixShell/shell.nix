{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } , ... }:


  pkgs.mkShell {
    buildInputs = with pkgs; [      

    ]
    ++ import ../../dev/emacs.nix { }
    ++ import ../../dev/dotnet.nix { }
    ++ import ../../dev/go/go.nix { }
    ++ import ../../dev/java/java.nix { }
    ++ import ../../dev/haskell.nix { }
    ++ import ../../dev/javascript/typescript.nix { }
    ++ import ../../dev/scala/scala.nix { }
    ++ import ../../dev/python/python.nix { }
    ++ import ../../dev/devtools/devtools.nix { }
    ++ import ../../dev/database/postgres.nix { } ;
  }


