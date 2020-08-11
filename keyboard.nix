{ config, pkgs, lib, ... }:

with pkgs.lib;

{
  
  services.xserver.layout = "us";
  # should move this to xmodmap. xmodmap doesnt work well if it doesnt manage everything
  #services.xserver.xkbOptions = "caps:ctrl_modifier";

  #services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${myCustomLayout}";
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ~/.Xmodmap";
}

