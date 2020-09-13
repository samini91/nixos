{ config, options, pkgs, ... }:

let
  # update this hash for newer versions of unstable stuff
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/d95c93c2ae63caeaa159039ff3136d8af7adcffd)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in
{
  # use absolute path here?
  imports = [
    ./dev/emacs.nix
    ./dev/haskell.nix
    ./dev/dotnet.nix
    ./dev/python/python.nix
    ./usr/gorgeous.nix
    ./keyboard.nix
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++ 
    # Append our nixpkgs-overlays.
    [ "nixpkgs-overlays=/etc/nixos/overlays/" ];


  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
  #time.timeZone = "Europe/Amsterdam";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nitrogen
    compton
    xorg.xmodmap
    xmobar
    dmenu
    unstable.emacs
		git
		firefox
    ripgrep
    gnumake
    sshfs
    wget
    alacritty
    ncmpcpp
    mpd
    keepassxc
    gcc
    postgresql
    zlib
    pavucontrol
	];

  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;  

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.xserver.xkbOptions = "ctrl:swapcaps";
  
  
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  services.xserver =
    {
      #desktopManager.plasma5.enable = true;
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      
      displayManager.sddm.enable = true;
    };
}

