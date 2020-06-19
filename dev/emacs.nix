{ config, lib, pkgs, ... }:

{

  home-manager.users.gorgeous.home.sessionVariables = {
    FOO = "Hello";
    BAR = "$FOO World!";
  };

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

}
