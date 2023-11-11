{ config, options, pkgs, specialArgs,... }:

{
  config.modules = {
    dev = {
      haskell.enable = true;
      rust.enable = true;
      nix.enable = true;
      dotnet.enable = true;
      java.enable = true;
      octave.enable = false;
      python.enable = true;
      scala.enable = false;
      node.enable = true;
      ruby.enable = false;
      devtools.enable = true;
    };
  };
}
