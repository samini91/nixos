{ pkgs ? import <nixpkgs> {} , ... }:

let
  # update this hash for newer versions of unstable stuff
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/a52e974cff8fb80c427e0d55c01b3b8c770ccec4){};
  # reuse the current configuration
in 
{
  pkgs.mkShell {
    buildInputs = [
      pkgs.which
      pkgs.htop
      pkgs.zlib
    ];
  };
}
