{ config, options, pkgs, specialArgs,... }:

{
  config.modules = {
    dev = {
      haskell.enable = false;
      rust.enable = false;
      nix.enable = false;
      dotnet.enable = false;
      java.enable = false;
      octave.enable = false;
      python.enable = false;
      scala.enable = false;
      node.enable = false;
      ruby.enable = false;
      devtools.enable = false;
    };
  };
}
