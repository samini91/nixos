{ pkgs, config, ... }:

{  
  environment.systemPackages = with pkgs; [
    python3
 #   ./mycookies/requirements.nix
#    ./packages.nix
  ];
}
