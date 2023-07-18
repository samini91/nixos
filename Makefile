Deploy: 
	sudo nixos-rebuild switch
CreateVM:
	nix build .#virtualbox
VM:
	sudo nixos-rebuild switch --flake .#vm
MiniCompLink:
	ln -sf hosts/MiniComp/hardware-configuration.nix hardware-configuration.nix
	ln -sf hosts/MiniComp/configuration.nix configuration.nix
NixOSLink:
	rm -rf /etc/nixos
	ln -sf $$(pwd) /etc/nixos
