{ config, pkgs, lib, ... }:

with pkgs.lib;

{
  config.console.useXkbConfig = false;
  #services.xserver.layout = "us";
  # should move this to xmodmap. xmodmap doesnt work well if it doesnt manage everything
  #services.xserver.xkbOptions = "caps:ctrl_modifier";

  #services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${myCustomLayout}";
  config.services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ~/.Xmodmap";
}

