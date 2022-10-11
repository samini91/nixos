{ pkgs ? import <nixpkgs> {}, ... }:

let
  # update this hash for newer versions of unstable stuff
  v22_05 = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/bea03ac862a747dcd8545bbbb9d5a1da6fcf0e8c){};
in 
[
  v22_05.emacs
]

#  home-manager.users.gorgeous.home.sessionVariables = {
#    FOO = "Hello";
#    BAR = "$FOO World!";
#  };

#  home.packages = [
#    pkgs.youtube-dl
#  ];
  #home-manager.users.gorgeous.services.xserver.windowManager.xmonad.enable = true;
#  home-manager.users.gorgeous.home.file = {
#
#    ".emacs.d".source = builtins.fetchGit {
#      url = "https://github.com/samini91/Emacs-Init.git";
#      ref = "master";
#    };
#    
#  };


