{ config, pkgs, ... }:

{
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

      home.file.".config/ncmpcpp/config".source = ./config/ncmpcpp/config;


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
    extraGroups = [ "wheel" "networkmanager"];
  };
}
