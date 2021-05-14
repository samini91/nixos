{ pkgs ? import <nixpkgs> {},
#, stdenv
#, fetchurl
#, mono5
#, makeWrapper,
  ... }:
{
    environment.systemPackages = with pkgs; [
    dotnetCorePackages.sdk_3_1
    dotnetCorePackages.netcore_3_1
    dotnetCorePackages.aspnetcore_3_1
    mono6
    (omnisharp-roslyn.overrideAttrs (oldAttrs: {
      version = "1.37.3";
    }))

    ];
    
}
