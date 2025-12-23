{
  description = "Gorgeous";

  inputs = 
    {
      # Core dependencies.
      nixpkgs = { url = "github:nixos/nixpkgs/nixos-25.11"; };
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # Unstable nixpkgs
      flake-utils.url = "github:numtide/flake-utils";
      nixos-generators = {
        url = "github:nix-community/nixos-generators";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      
      home-manager.url = "github:rycee/home-manager/release-25.11";
      # home-manager.url = "github:rycee/home-manager/master";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      agenix.url = "github:ryantm/agenix";
      agenix.inputs.nixpkgs.follows = "nixpkgs";
      rust-overlay.url = "github:oxalica/rust-overlay";

      # Extras
      emacs-overlay.url  = "github:nix-community/emacs-overlay";
      # nixos-hardware.url = "github:nixos/nixos-hardware";
    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, rust-overlay, nixos-generators, flake-utils, emacs-overlay ,... }:
    let
      overlay-unstable = final: prev: {
        unstable = nixpkgs.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
        # unstable = import nixpkgs-unstable {
        #   inherit system;
        #   config.allowUnfree = true;
        # };

      };
      mypkgs = system: import nixpkgs {
        inherit system;
        overlays = [
          emacs-overlay.overlay
        ];
      };

    in 
      rec {
        system = "x86_64-linux";
        overlays = [rust-overlay];

        packages.x86_64-linux = {
          install-iso = nixos-generators.nixosGenerate {
            inherit system;
            modules = [
              ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/common.nix
              ./modules/dev/default.nix
              ./usr/gorgeous.nix
            ];
            specialArgs = { inherit inputs system; };
            format = "install-iso";
            
            # you can also define your own custom formats
            # customFormats = { "myFormat" = <myFormatModule>; ... };
            # format = "myFormat";
          };

          virtualbox = nixos-generators.nixosGenerate {
            inherit system;
            modules = [
              ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/common.nix
              ./modules/dev/default.nix
              ./usr/gorgeous.nix
            ];
            specialArgs = { inherit inputs system; };
            format = "virtualbox";
          };

          virtualboxM1 = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            modules = [
              ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/common.nix
              ./modules/dev/default.nix
              ./usr/gorgeous.nix
            ];
            specialArgs = { inherit inputs system; };
            format = "qcow";
            
            # you can also define your own custom formats
            # customFormats = { "myFormat" = <myFormatModule>; ... };
            # format = "myFormat";
          };
        };

        nixosConfigurations = {


          vm_desktop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              ({ config, pkgs, ... }: {
                nixpkgs.overlays = [ overlay-unstable ];
                nixpkgs.config.android_sdk.accept_license = true;
              })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/vm_desktop/configuration.nix
            ];
            # This maps to specialargs see vm/configuration.nix
            specialArgs = { inherit inputs system; };
            # specialArgs = inputs;
            # specialArgs.channels = { inherit nixpkgs unstable; };
          };

          vm_laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              ({ config, pkgs, ... }: {
                nixpkgs.overlays = [ overlay-unstable ];
                nixpkgs.config.android_sdk.accept_license = true;
              })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/vm_laptop/configuration.nix
            ];
            # This maps to specialargs see vm/configuration.nix
            specialArgs = { inherit inputs system; };
            # specialArgs = inputs;
            # specialArgs.channels = { inherit nixpkgs unstable; };
          };


          minicomp = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              ({ config, pkgs, ... }: {
                nixpkgs.overlays = [ overlay-unstable ];
              })
              ./modules/dev/default.nix
              home-manager.nixosModules.home-manager
              ./hosts/minicomp/configuration.nix
            ];
            # This maps to specialargs see vm/configuration.nix
            specialArgs = { inherit inputs system; };
            # specialArgs = inputs;
            # specialArgs.channels = { inherit nixpkgs unstable; };
          };


        };
      }
      # For "nix develop"
      // flake-utils.lib.eachDefaultSystem 
        (system:
          {
            devShells.default = import ./hosts/nixshell/shell.nix { pkgs = mypkgs system; };
          }
        );
}
