{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    dotnetCorePackages.sdk_3_1
  	dotnetCorePackages.netcore_3_1
    dotnetCorePackages.aspnetcore_3_1
  ];
}
