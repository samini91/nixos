{ pkgs , ... }:

pkgs.mkShell {
  imports = [
    
  ] ;
  packages = with pkgs; [      
    emacs29
    ripgrep
    git
    gnumake
    sshfs
    wget
    cmake
    libtool
    # libvterm
    minikube

    python311
    nodePackages_latest.pyright
  ] ;
}


