# generated using pypi2nix tool (version: 2.0.4)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -e my_cookies -E openssl
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
  };

  commonBuildInputs = with pkgs; [ openssl ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "browser-cookie3" = python.mkDerivation {
      name = "browser-cookie3-0.11.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/de/8a/6459b1b2dc8fb908337d354795c0fc59fba9046dd69d8ceec7dc2b968a45/browser-cookie3-0.11.1.tar.gz";
        sha256 = "5d1f825fc9cc6f98fe0ee3f97cdb4947c22d59ac8a11643da5837ebd8c873f05";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."keyring"
        self."lz4"
        self."pbkdf2"
        self."pyaes"
        self."pycryptodome"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/borisbabic/browser_cookie3";
        license = "lgpl";
        description = "Loads cookies from your browser into a cookiejar object so can download with urllib and other libraries the same content you see in the web browser.";
      };
    };

    "cffi" = python.mkDerivation {
      name = "cffi-1.14.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/05/54/3324b0c46340c31b909fcec598696aaec7ddc8c18a63f2db352562d3354c/cffi-1.14.0.tar.gz";
        sha256 = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."pycparser"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };

    "cryptography" = python.mkDerivation {
      name = "cryptography-2.9.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/56/3b/78c6816918fdf2405d62c98e48589112669f36711e50158a0c15d804c30d/cryptography-2.9.2.tar.gz";
        sha256 = "a0c30272fb4ddda5f5ffc1089d7405b7a71b0b0f51993cb4e5dbb4590b2fc229";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."cffi"
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."cffi"
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.asl20;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
      };
    };

    "flit-core" = python.mkDerivation {
      name = "flit-core-2.3.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/bb/92/e51c58d463ebbabb7b226662655cef6d17d3b4b83f570b08f6be0fe2b1b8/flit_core-2.3.0.tar.gz";
        sha256 = "a50bcd8bf5785e3a7d95434244f30ba693e794c5204ac1ee908fc07c4acdbf80";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."pytoml"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/takluyver/flit";
        license = licenses.bsdOriginal;
        description = "Distribution-building parts of Flit. See flit package for more information";
      };
    };

    "importlib-metadata" = python.mkDerivation {
      name = "importlib-metadata-1.7.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz";
        sha256 = "90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."setuptools-scm"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."zipp"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://importlib-metadata.readthedocs.io/";
        license = licenses.asl20;
        description = "Read metadata from Python packages";
      };
    };

    "jeepney" = python.mkDerivation {
      name = "jeepney-0.4.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/74/24/9b720cc6b2a73c908896a0ed64cb49780dcfbf4964e23a725aa6323f4452/jeepney-0.4.3.tar.gz";
        sha256 = "3479b861cc2b6407de5188695fa1a8d57e5072d7059322469b62628869b8e36e";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."flit-core"
      ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/takluyver/jeepney";
        license = licenses.mit;
        description = "Low-level, pure Python DBus protocol wrapper.";
      };
    };

    "keyring" = python.mkDerivation {
      name = "keyring-21.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/a6/52/eb8a0e13b54ec9240c7dd68fcd0951c52f62033d438af372831af770f7cc/keyring-21.2.1.tar.gz";
        sha256 = "c53e0e5ccde3ad34284a40ce7976b5b3a3d6de70344c3f8ee44364cc340976ec";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."setuptools-scm"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."importlib-metadata"
        self."jeepney"
        self."secretstorage"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jaraco/keyring";
        license = licenses.mit;
        description = "Store and access your passwords safely.";
      };
    };

    "lz4" = python.mkDerivation {
      name = "lz4-3.1.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/4c/c3/97c5aaeb8c70eafb0cba7dcbcb7709c2697d8a92bdef90d36b018dc502f6/lz4-3.1.0.tar.gz";
        sha256 = "debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-lz4/python-lz4";
        license = licenses.bsdOriginal;
        description = "LZ4 Bindings for Python";
      };
    };

    "my-cookies" = python.mkDerivation {
      name = "my-cookies-0.1.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/41/73/faf1365f1b1935ba216335410cb157bc77cd3a1a1c596da11d36587f5d32/my_cookies-0.1.1.tar.gz";
        sha256 = "4835df26830247e70f5edfd291356391d769637750e3f5a32adc25c541bbdbb0";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."browser-cookie3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kaiwk/my_cookies";
        license = licenses.mit;
        description = "Retrieve chrome cookies";
      };
    };

    "pbkdf2" = python.mkDerivation {
      name = "pbkdf2-1.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/02/c0/6a2376ae81beb82eda645a091684c0b0becb86b972def7849ea9066e3d5e/pbkdf2-1.3.tar.gz";
        sha256 = "ac6397369f128212c43064a2b4878038dab78dab41875364554aaf2a684e6979";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.dlitz.net/software/python-pbkdf2/";
        license = licenses.mit;
        description = "PKCS#5 v2.0 PBKDF2 Module";
      };
    };

    "pyaes" = python.mkDerivation {
      name = "pyaes-1.6.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/44/66/2c17bae31c906613795711fc78045c285048168919ace2220daa372c7d72/pyaes-1.6.1.tar.gz";
        sha256 = "02c1b1405c38d3c370b085fb952dd8bea3fadcee6411ad99f312cc129c536d8f";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ricmoo/pyaes";
        license = licenses.mit;
        description = "Pure-Python Implementation of the AES block-cipher and common modes of operation";
      };
    };

    "pycparser" = python.mkDerivation {
      name = "pycparser-2.20";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz";
        sha256 = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };

    "pycryptodome" = python.mkDerivation {
      name = "pycryptodome-3.9.8";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/4c/2b/eddbfc56076fae8deccca274a5c70a9eb1e0b334da0a33f894a420d0fe93/pycryptodome-3.9.8.tar.gz";
        sha256 = "0e24171cf01021bc5dc17d6a9d4f33a048f09d62cc3f62541e95ef104588bda4";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.pycryptodome.org";
        license = licenses.bsdOriginal;
        description = "Cryptographic library for Python";
      };
    };

    "pytoml" = python.mkDerivation {
      name = "pytoml-0.1.21";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/f4/ba/98ee2054a2d7b8bebd367d442e089489250b6dc2aee558b000e961467212/pytoml-0.1.21.tar.gz";
        sha256 = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/avakar/pytoml";
        license = licenses.mit;
        description = "A parser for TOML-0.4.0";
      };
    };

    "secretstorage" = python.mkDerivation {
      name = "secretstorage-3.1.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fd/9f/36197c75d9a09b1ab63f56cb985af6cd858ca3fc41fd9cd890ce69bae5b9/SecretStorage-3.1.2.tar.gz";
        sha256 = "15da8a989b65498e29be338b3b279965f1b8f09b9668bd8010da183024c8bff6";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."cryptography"
        self."jeepney"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/mitya57/secretstorage";
        license = licenses.bsdOriginal;
        description = "Python bindings to FreeDesktop.org Secret Service API";
      };
    };

    "setuptools" = python.mkDerivation {
      name = "setuptools-48.0.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b4/28/cb684152691c3ba02dd8081b084b3d846b39bed11f922f289762bdee036e/setuptools-48.0.0.zip";
        sha256 = "f41d7db7eefd25992bd46a88e39fa5be34e6307a46c6942363c924f036b912e8";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools";
        license = licenses.mit;
        description = "Easily download, build, install, upgrade, and uninstall Python packages";
      };
    };

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-4.1.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cd/66/fa77e809b7cb1c2e14b48c7fc8a8cd657a27f4f9abb848df0c967b6e4e11/setuptools_scm-4.1.2.tar.gz";
        sha256 = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."setuptools"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.15.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz";
        sha256 = "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "toml" = python.mkDerivation {
      name = "toml-0.10.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/da/24/84d5c108e818ca294efe7c1ce237b42118643ce58a14d2462b3b2e3800d5/toml-0.10.1.tar.gz";
        sha256 = "926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/uiri/toml";
        license = licenses.mit;
        description = "Python Library for Tom's Obvious, Minimal Language";
      };
    };

    "wheel" = python.mkDerivation {
      name = "wheel-0.34.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/75/28/521c6dc7fef23a68368efefdcd682f5b3d1d58c2b90b06dc1d0b805b51ae/wheel-0.34.2.tar.gz";
        sha256 = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
      ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/wheel";
        license = licenses.mit;
        description = "A built-package format for Python";
      };
    };

    "zipp" = python.mkDerivation {
      name = "zipp-3.1.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ce/8c/2c5f7dc1b418f659d36c04dec9446612fc7b45c8095cc7369dd772513055/zipp-3.1.0.tar.gz";
        sha256 = "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."setuptools-scm"
        self."wheel"
      ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jaraco/zipp";
        license = licenses.mit;
        description = "Backport of pathlib-compatible object wrapper for zip files";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (let src = pkgs.fetchFromGitHub { owner = "nix-community"; repo = "pypi2nix-overrides"; rev = "90e891e83ffd9e55917c48d24624454620d112f0"; sha256 = "0cl1r3sxibgn1ks9xyf5n3rdawq4hlcw4n6xfhg3s1kknz54jp9y"; } ; in import "${src}/overrides.nix" { inherit pkgs python; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )