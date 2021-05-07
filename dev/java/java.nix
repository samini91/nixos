{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk11
  ];
}
