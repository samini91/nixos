# System level configs that I would want on every machine
{ config, options, pkgs, ... }:

let
  listFuncs = pkgs.lib.lists;
in
{

  imports = [                   
    ../keyboard.nix
  ];

  #environment.systemPackages =
  config.virtualisation.docker.enable = true;
  config.nixpkgs.config.allowUnfree = true;

  config.environment.systemPackages = with pkgs; [
    nitrogen
    # compton
    picom
    xorg.xmodmap
    xmobar
    dmenu
		firefox
    alacritty
    ncmpcpp
    mpd
    # ncmpcpp
    # mpd
    keepassxc
    gcc
    pavucontrol
    gparted   
    zk-shell
    zlib
    zlib.dev
    p7zip
    vlc
    arandr
    haskellPackages.xmobar
    emacs
    ripgrep

    git
    ripgrep
    gnumake
    sshfs
    wget
    wireshark
    unzip
    cmake
    libtool
    libvterm
    xdotool
    inxi
    unstable.minikube
    nixos-generators
    trayer
    # pkg-config
    # openssl
    # openssl.dev
	];

  
  config.nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;  

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  config.services.openssh.enable = true;

  # Enable sound.
  config.sound.enable = true;
  config.hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  config.services.xserver.enable = true;
  #services.xserver.xkbOptions = "ctrl:swapcaps";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  config.services.xserver =
    {
      # displayManager.gdm.enable = true;
      # desktopManager.plasma5.enable = true;
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      windowManager.xmonad.extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmobar
        haskellPackages.monad-logger
        # haskellPackages.xmonad-screenshot
        haskellPackages.dbus
        haskellPackages.List
        haskellPackages.xmonad
      ];
      
      # displayManager.sddm.enable = true;
      displayManager.lightdm.enable = true;
    };

  config.fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    carlito
  ];

  # config.services.picom = {
  #   enable = true;
  # };
  # config.services.picom = {
  #   enable = true;
  #   activeOpacity = 0.96;
  #   inactiveOpacity = 0.75;
  #   settings = {
  #     blur-background = true;
  #     blur-background-frame = true;
  #     blur-background-fixed = true;
  #     blur-kern = "7x7box";
  #     blur-strength = 340;
  #   };
  # };

}

