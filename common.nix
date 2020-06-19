{ config, pkgs, ... }:

{
  # use absolute path here?
  imports = [
    ./dev/emacs.nix
    ./dev/haskell.nix
    ./usr/gorgeous.nix
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  nixpkgs.config.allowUnfree = true; 
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

  environment.systemPackages = with pkgs; [
   	emacs
		git
		firefox
    ripgrep
    gnumake
    sshfs
    wget
    alacritty
    ncmpcpp
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
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:ctrl_modifier";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  services.xserver =
    {
      desktopManager.plasma5.enable = true;
      #windowManager.xmonad.enable = true;
      displayManager.sddm.enable = true;
    };
}

