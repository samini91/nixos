{ config, options, pkgs, specialArgs,... }:

{
  config.modules = {
    dev = {
      haskell.enable = true;
      rust.enable = true;
      nix.enable = true;
      dotnet.enable = true;
      java.enable = true;
      octave.enable = true;
      python.enable = true;
      scala.enable = true;
      node.enable = true;
    };
  };
}
