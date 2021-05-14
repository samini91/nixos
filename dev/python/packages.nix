{ pkgs, ... }:

with pkgs;

let

  browser-cookie3 = python3.pkgs.buildPythonPackage rec {
    name = "browser-cookie3-0.11.1";
    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/de/8a/6459b1b2dc8fb908337d354795c0fc59fba9046dd69d8ceec7dc2b968a45/browser-cookie3-0.11.1.tar.gz";
      sha256 = "5d1f825fc9cc6f98fe0ee3f97cdb4947c22d59ac8a11643da5837ebd8c873f05";
    };
  };
  
  mycookies = python3.pkgs.buildPythonPackage rec {
    pname = "my_cookies";
    version = "0.1.1";
    src = python3.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "1c6vpd0wa9fw5aizbqshfxinkmwiccsr3lnzbq7yfiq2hckdyda8";
    };
    propagatedBuildInputs = [ browser-cookie3 ];
    buildInputs = [ openssl ];
    hardeningDisable = ["format"];
  };
  
  my-python-packages = python-packages: with python-packages; [
    #pandas
    #requests
    pip
    setuptools
    #pyaes
    #pbkdf2
    #zipp
    #jeepney
    #cryptography
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
  
in
{
  environment.systemPackages = with pkgs; [
    
    mycookies
    pypi2nix
    python-with-my-packages
  ];
}
