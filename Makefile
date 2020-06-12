Deploy: 
	sudo nixos-rebuild switch
VM:
	ln -sf hosts/VM/hardware-configuration.nix hardware-configuration.nix
	sudo nixos-rebuild switch
DOIT:
	rm -rf /etc/nixos
	ln -sf $$(pwd) /etc/nixos
