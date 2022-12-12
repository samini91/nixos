{ config, options, pkgs, lib, ... }:
with pkgs;
with lib;
let devCfg = config.modules.dev;
    cfg = devCfg.dotnet;
in
{
  options.modules.dev.dotnet.enable = mkEnableOption "DotNet";  

  config.environment.systemPackages = mkIf cfg.enable ([
    dotnet-sdk
    dotnet-aspnetcore
    mono
    omnisharp-roslyn  
  ]);#
  # dotnetCorePackages.sdk_3_1
  # dotnetCorePackages.netcore_3_1
  # dotnetCorePackages.aspnetcore_3_1
  # mono6
}


