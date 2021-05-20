{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem, nodejs ? pkgs."nodejs-10_x"}:

let
  inherit (pkgs) fetchurl;
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };

  npm_6_9_0= nodeEnv.buildNodePackage {
    name = "npm";
    packageName = "npm";
    version = "6.9.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/npm/-/npm-6.9.0.tgz";
      sha512 = "f7557ecc1e610f13be272a76b14292ee3b8794833de5d190c53790b66648d67008ffb923597162a4faedc302a38722a65781ac4b62f3261af1463196b14f73ff";
    };
    buildInputs = [];
    meta = {
      description = "a package manager for JavaScript";
      homepage = https://docs.npmjs.com/;
      license = "Artistic-2.0";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };

in

with pkgs; with nodePackages; [
  #node2nix # this will stomp over npm versions below so ordering matters
  #nodejs-10_x
  npm_6_9_0 
  ]

  #stuff = with pkgs; with nodePackages; [
  #  nodejs
  #  npm
  #];

