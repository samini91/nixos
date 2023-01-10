{ pkgs, modulesPath, lib, ... }: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  # use the latest Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Needed for https://github.com/NixOS/nixpkgs/issues/58959
  boot.supportedFilesystems = lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
}

#$ NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs/archive/74e2faf5965a12e8fa5cff799b1b19c6cd26b0e3.tar.gz nix-shell -p nixos-generators --run "nixos-generate --format iso --configuration ./isoimage.nix.nix -o result"
