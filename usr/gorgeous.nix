{ config, pkgs, ... }:

{
  #home-manager.users.gorgeous.nixpkgs.config = import ./nixpkgs-config.nix;
  home-manager.users.gorgeous.nixpkgs.config.allowUnfree = true;
  #dotfiledir =

  home-manager.users.gorgeous = {
    
    programs.git = {
      enable = true;
      userName = "samini91";
      userEmail = "samini91@gmail.com";
    };

    programs.alacritty = {
      enable = true;
      settings = {
    	  font.size = 11;
        shell.program = "/usr/local/bin/fish";
      };
    };

    programs.vscode = {
      enable = true;
    };

    home.file.".config/ncmpcpp/config".source = ./config/ncmpcpp/config;

    # reload by modifier-shift-q

    home.file.".xmonad/xmonad.hs".source = ./config/xmonad/xmonad.hs;
    home.file.".Xmodmap".source = ./config/.Xmodmap;
    home.file.".config/compton/compton.conf".source = ./config/compton/compton.conf;
    


    #        builtins.fetchGit {
    #          url = "https://github.com/samini91/Emacs-Init.git";
    #          ref = "master";
    #        };
    #"../config/ncmpcpp/config";
    
    #configFile."i3blocks/config".source = "${my-dotfile-dir}/i3blocks.conf";
    #xdg.configFile."i3blocks/config".source = "${my-dotfile-dir}/i3blocks.conf"

    #      home.file = {
    #
    #        "abc".source = builtins.fetchGit {
    #          url = "https://github.com/samini91/Emacs-Init.git";
    #          ref = "master";
    #        };
    #        
    #      };


  };

  
  

  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gorgeous = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "docker"];
  };
}
