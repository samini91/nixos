{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs; [
  dotnet-sdk
  dotnet-aspnetcore
  mono
  dotnetCorePackages.sdk_3_1
  dotnetCorePackages.netcore_3_1
  dotnetCorePackages.aspnetcore_3_1
  mono6
  omnisharp-roslyn
]

