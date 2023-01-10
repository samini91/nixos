# System level configs that I would want on every machine
{ config, options, pkgs, ... }:

let
  # update this hash for newer versions of unstable stuff
#  unstable = import
#    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/a52e974cff8fb80c427e0d55c01b3b8c770ccec4){};
    # reuse the current configuration
    #{ config = config.nixpkgs.config; };

  # home-manager = builtins.fetchGit {
  #   url = "https://github.com/rycee/home-manager.git";
  #   rev = "b819d2cc414e0d14fd078551399f58c087a72ae7";
  # };

  listFuncs = pkgs.lib.lists;
in
{
  imports = [                   
    ./usr/gorgeous.nix
    ./keyboard.nix
    # (import "${home-manager}/nixos")
    #(import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  #environment.systemPackages =
  config.virtualisation.docker.enable = true;

  # nix.nixPath =
  #   # Prepend default nixPath values.
  #   options.nix.nixPath.default ++ 
  #   # Append our nixpkgs-overlays.
  #   [ "nixpkgs-overlays=/etc/nixos/overlays/" ];


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

  config.nixpkgs.config.allowUnfree = true;

  # modules.dev.haskell.enable = true;

  # listFunc.flatten doesnt work when importing a list for some reason
  config.environment.systemPackages = with pkgs; [
    nitrogen
    compton
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
	];
  # ++ import ./dev/javascript/typescript.nix { }
  # ++ import ./dev/emacs.nix { };
  # ++ import ./dev/dotnet.nix { }
  # ++ import ./dev/go/go.nix { }

  # ++ import ./dev/haskell.nix { inherit pkgs; inherit config; inherit options; }
  # ++ import ./dev/rust.nix { inherit pkgs;};

  # ++ import ./dev/python/python.nix { }
  # ++ import ./dev/java/java.nix { }
  # ++ import ./dev/nix.nix { }
  # ++ import ./dev/scala/scala.nix { }
  # ++ import ./dev/devtools/devtools.nix { }
  # ++ import ./dev/database/postgres.nix {} 
  # ++ import ./dev/octave.nix {} ;

  config.nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;  

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  config.services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  config.sound.enable = true;
  config.hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  config.services.xserver.enable = true;
  #services.xserver.xkbOptions = "ctrl:swapcaps";

  # Postgres
  # services.postgresql.enable = true;
  # services.postgresql.package = pkgs.postgresql_11;

 # services.zookeeper.enable = true;
 # services.apache-kafka.enable = true;
  
  
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


  
  # services.picom = {
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

