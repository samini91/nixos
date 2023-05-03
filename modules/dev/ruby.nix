{ config, options, pkgs, lib, ... }:

with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.ruby;
in {
  options.modules.dev.ruby.enable = mkEnableOption "Ruby";

  config.environment.systemPackages = mkIf cfg.enable (with pkgs; with rubyPackages; [
    ruby
    solargraph
    bundix
    bundler
    sqlite
  ]);
}
