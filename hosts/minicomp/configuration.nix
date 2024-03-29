# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
    ../common.nix
    ./modules.nix
    ../../usr/gorgeous.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  nixpkgs.config.allowUnfree = true;

    nix = {
    #binaryCaches          = [ "https://hydra.iohk.io" "https://cache.iog.io" ];
    #binaryCaches          = [ "https://cache.iog.io" ];
    #binaryCachePublicKeys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" ];
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     thunderbird
  #   ];
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    #recommendedTlsSettings = true;
    # other Nginx options
    virtualHosts."syncer" =  {
#      enableACME = true;
#      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8384";
        proxyWebsockets = true; # needed if you need to use WebSocket
#        extraConfig =
#          # required when the target is also TLS server with multiple hosts
#          "proxy_ssl_server_name on;" +
#          # required when the server wants to use HTTP Authentication
#          "proxy_pass_header Authorization;"
#          ;
      };
    };
};

  services = {
    syncthing = {
      enable = true;
      guiAddress="0.0.0.0:8384";
      user = "gorgeous";
      group = "users";
      extraOptions.gui = {
        user = "gorgeous";
        password = "asdf";
      };
    };
  };

# journalctl -fu ytripper
# systemctl list-units --type=service
# systemctl list-timers --all
  systemd.timers."ytripper" = {
    wantedBy = [ "timers.target" ];
    partOf = [ "ytripper.service" ];
    timerConfig = {
      OnBootSec = "30m";
      OnUnitActiveSec = "30m";
      Unit = "ytripper.service";
    };
  };

  systemd.services."ytripper" = {
    script = ''
    export GOOGLE_CLIENT_ID=964068033680-74ff3781pvbp170kgu7oiboo461uar2j.apps.googleusercontent.com
    export GOOGLE_CLIENT_SECRET=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
    export DOWNLOAD_FOLDER=/home/gorgeous/Music
    export TOKEN_PERSIST_PATH=/home/gorgeous/Desktop/ytmusicripperbin/tokens

    /home/gorgeous/Desktop/ytmusicripperbin/cli
  '';
    path = [
      pkgs.ffmpeg-full
      pkgs.pkg-config
    ];
    serviceConfig = {
      Type = "oneshot";
      User = "gorgeous";
    };
  };

  # Open ports in the firewall.
  #networking.firewall.trustedInterfaces = [ "docker0" ];
  networking.firewall.allowedTCPPorts = [ 3000 80 443 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 3000 80 443 8384 22000 21027 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
