Deploy: 
	sudo nixos-rebuild switch
VM:
	ln -sf hosts/VM/hardware-configuration.nix hardware-configuration.nix
	ln -sf hosts/VM/configuration.nix configuration.nix
MiniCompLink:
	ln -sf hosts/MiniComp/hardware-configuration.nix hardware-configuration.nix
	ln -sf hosts/MiniComp/configuration.nix configuration.nix
NixOSLink:
	rm -rf /etc/nixos
	ln -sf $$(pwd) /etc/nixos
