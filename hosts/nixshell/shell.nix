{ pkgs , ... }:

pkgs.mkShell {
  myEmacs = (pkgs.emacsPackagesFor pkgs.emacs) (epkgs: with epkgs; [
    vterm
    treesit-grammers.with-all-grammers
  ]);

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
    omnisharp-rosyln
    netcoredbg
    typescript-go
    python311
    pyright
    sqls
    yaml-language-server
    mermaid-cli
  ] ;
}


