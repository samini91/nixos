{ pkgs , ... }:

let
    myEmacs = (pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (epkgs: with epkgs; [
      vterm
      treesit-grammars.with-all-grammars
    ]);
in
pkgs.mkShell {
  imports = [
      
  ] ;
  packages = with pkgs; [      
    myEmacs
    ripgrep
    git
    gnumake
    sshfs
    wget
    cmake
    libtool
    # libvterm
    minikube
    nixd
    omnisharp-roslyn
    netcoredbg
    typescript-go
    python311
    pyright
    sqls
    yaml-language-server
    mermaid-cli
  ] ;
}


