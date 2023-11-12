Deploy: 
	sudo nixos-rebuild switch
VM:
	sudo nixos-rebuild switch --flake .#vm
MiniComp:
	sudo nixos-rebuild switch --flake .#minicomp
MiniCompLink:
	ln -sf hosts/MiniComp/hardware-configuration.nix hardware-configuration.nix
	ln -sf hosts/MiniComp/configuration.nix configuration.nix
NixOSLink:
	rm -rf /etc/nixos
	ln -sf $$(pwd) /etc/nixos
