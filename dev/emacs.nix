{ pkgs ? import <nixpkgs> {}, ... }:

let
  # update this hash for newer versions of unstable stuff
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/a52e974cff8fb80c427e0d55c01b3b8c770ccec4){};
in 
[
  unstable.emacs
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


