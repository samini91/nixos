{ pkgs , ... }:

pkgs.mkShell {
  imports = [
    
  ] ;
  packages = with pkgs; [      
    emacs
    ripgrep
    git
    gnumake
    sshfs
    wget
    cmake
    libtool
    libvterm
    minikube
  ] ;
}


