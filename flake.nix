{
  description = "Gorgeous";

  inputs = 
    {
      # Core dependencies.
      # nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";             # primary nixpkgs
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      flake-utils.url = "github:numtide/flake-utils";
      
      # home-manager.url = "github:rycee/home-manager/release-22.05";
      home-manager.url = "github:rycee/home-manager/master";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      agenix.url = "github:ryantm/agenix";
      agenix.inputs.nixpkgs.follows = "nixpkgs";
      rust-overlay.url = "github:oxalica/rust-overlay";

      # Extras
      emacs-overlay.url  = "github:nix-community/emacs-overlay";
      # nixos-hardware.url = "github:nixos/nixos-hardware";
    };

  outputs = inputs @ { self, nixpkgs, home-manager, rust-overlay, flake-utils ,... }:
    rec {
      system = "x86_64-linux";
      overlays = [rust-overlay];

      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/dev/default.nix
            home-manager.nixosModules.home-manager
            ./hosts/vm/configuration.nix
          ];
          specialArgs = { inherit inputs system; };
        };

        isoImage = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
            ./overlays
            ./hosts/vm/modules.nix
            ./modules/dev/default.nix
            ./hosts/common.nix
            home-manager.nixosModules.home-manager
            # ./hosts/VM/configuration.nix
          ];
          specialArgs = { inherit inputs system; };
        };
        
      };
    }
    # For "nix develop"
    // flake-utils.lib.eachDefaultSystem 
      (system:
        {
          devShells.default = import ./shell.nix { pkgs = nixpkgs.legacyPackages.${system}; };
        }
      );
}
