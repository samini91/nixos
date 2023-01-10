{ config, options, pkgs, specialArgs,... }:
{
  nixpkgs.overlays = [ (import specialArgs.inputs.rust-overlay) ];
}
