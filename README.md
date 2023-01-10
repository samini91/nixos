Generates Proper Nix config for Python Packages: 
sudo pypi2nix -e "my_cookies" -E "openssl"
Mod - q reloads xmonad you need to sudo nixos-rebuild switch to have the new xmonad.hs be binded before trying the command

Create isoimage
nix build .#nixosConfigurations.vm.config.system.build.isoImage

Emacs Omnisharp
Need to set customize "Lsp Csharp Omnisharp Roslyn Server Dir: File" to "/run/current-system/sw/bin"
