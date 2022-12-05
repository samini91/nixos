{
  description = "WOOOOOOOOOOOOOOOO";

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
    let
      # inherit (lib.my) mapModules mapModulesRec mapHosts;

      system = "x86_64-linux";
      # pkgs = import nixpkgs {
      #   inherit system;
      #   config.allowUnfree = true;
      # };
      # lib = nixpkgs.lib;



      # mkPkgs = pkgs: extraOverlays: import pkgs {
      #   inherit system;
      #   config.allowUnfree = true;  # forgive me Stallman senpai
      #   overlays = extraOverlays ++ (lib.attrValues self.overlays);
      # };
      # pkgs  = mkPkgs nixpkgs [ self.overlay ];
      # pkgs' = mkPkgs nixpkgs-unstable [];

      # lib = nixpkgs.lib.extend
      #   (self: super: { my = import ./lib { inherit pkgs inputs; lib = self; }; });
    in {
      # lib = lib.my;

      # overlay =
      #   final: prev: {
      #     unstable = pkgs';
      #     my = self.packages."${system}";
      #   };

      overlays = [rust-overlay];
      #overlays.vm = [rust-overlay];
      # overlays =
      #   mapModules ./overlays import;

      # packages."${system}" =
      #   mapModules ./packages (p: pkgs.callPackage p {});

      # nixosModules =
      #   { dotfiles = import ./.; } // mapModulesRec ./modules import;
      # nixosConfigurations = mkSystem {import ./configuration.nix};
      # nixosConfigurations = import ./configuration.nix { pkgs=nixpkgs; } // {system = "x86_64-linux";};
      # nixosConfigurations.MAIN = import ./configuration.nix {
      #   inherit system;
      #   pkgs = nixpkgs;
      # };
      
      #nixosModules = asdf./dev/haskell.nix;
      #nixosModules = { config }: { imports = [ ./dev/haskell.nix ]; };

        # ./dev/rust.nix;
      # sudo nixos-rebuild test --flake ".#MAIN"
      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./dev/default.nix
            home-manager.nixosModules.home-manager
            ./hosts/VM/configuration.nix
            # import ./configuration.nix { pkgs = nixpkgs;  }
          ];
          specialArgs = { inherit inputs system; };
        };
      };
       #  {
      #   inherit system;
      #   pkgs = nixpkgs;
      # };
      # nix develop
      # devShell = import ./shell.nix { pkgs = nixpkgs; };
      devShell."${system}" = import ./shell.nix { pkgs =  nixpkgs.legacyPackages.${system}; };
        #flake-utils.lib.eachDefaultSystem
        #(system:
        #  let pkgs = nixpkgs.legacyPackages.${system};
        #  in
        #    import ./shell.nix { inherit pkgs; }
        #);

      #flake-utils.lib.eachDefaultSystem
      #  (system:
      #    let pkgs = nixpkgs.legacyPackages.${system}; in
      #    {
      #      devShells.default = import ./shell.nix { inherit pkgs; };
      #    }
      #  );


      # templates = {
      #   full = {
      #     path = ./.;
      #     description = "A grossly incandescent nixos config";
      #   };
      # } // import ./templates;
      # defaultTemplate = self.templates.full;

      # defaultApp."${system}" = {
      #   type = "app";
      #   program = ./bin/hey;
      # };
    };
}
