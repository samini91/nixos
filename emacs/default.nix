{ config, lib, pkgs, ... }:

{

  home-manager.users.gorgeous.home.sessionVariables = {
    FOO = "Hello";
    BAR = "$FOO World!";
  };

  home-manager.users.gorgeous.home.file = {

    "abc".source = builtins.fetchGit {
      url = "https://github.com/samini91/Emacs-Init.git";
      ref = "master";
    };
    
  };

}
