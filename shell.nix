{ pkgs }:
with pkgs;
pkgs.mkShell {
  buildInputs = [
    nixpkgs-fmt
  ];

  shellHook = ''
  '';
}

