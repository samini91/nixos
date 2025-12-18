{ config, options, pkgs, lib, ... }:

with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.android;
in {
  options.modules.dev.android.enable = mkEnableOption "Android";
  
  config.environment.systemPackages = mkIf cfg.enable (with pkgs; [
    android-studio
#    androidenv.androidPkgs_9_0.androidsdk
  ]);    
}
