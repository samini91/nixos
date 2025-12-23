Generates Proper Nix config for Python Packages: 
sudo pypi2nix -e "my_cookies" -E "openssl"
Mod - q reloads xmonad you need to sudo nixos-rebuild switch to have the new xmonad.hs be binded before trying the command

Create isoimage
nix build .#iso

Create virtualbox image
nix build .#virtualbox

Emacs Omnisharp
Need to set customize "Lsp Csharp Omnisharp Roslyn Server Dir: File" to "/run/current-system/sw/bin"


How to test the flake build
sudo nixos-rebuild test --flake .#vm
How to switch the flake build
sudo nixos-rebuild switch --flake .#vm_desktop

sudo nixos-rebuild switch --flake .#vm_laptop

To remove nix packages that are not used 
nix-collect-garbage


vmhgfs-fuse ~/Music




$ nix-env --list-generations --profile /nix/var/nix/profiles/system
# pick a couple or one to remove
$ nix-env --delete-generations --profile /nix/var/nix/profiles/system 163 164
# or anything older than 5 days
$ nix-env --delete-generations --profile /nix/var/nix/profiles/system 



xrandr 

xrandr --newmode "2560x1440_360" 359.98 2560 2608 2640 2720 1440 1443 1448 1481
xrandr --addmode Virtual-1 2560x1440_360
xrandr --output Virtual-1 --mode 2560x1440_360

Laptop
xrandr --output  --output Virtual-1 --mode 2560x1600 --scale .8x.8

