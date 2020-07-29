self: super: {
  # this doesnt work... 
  myomnisharp = self.stdenv.mkDerivation rec {

    pname = "omnisharp-roslyn";
    version = "1.35.1";

    src = self.fetchurl {
      url = "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${version}/omnisharp-mono.tar.gz";
      sha256 = "0gx87qc9r3lhqn6q95y74z67sjcxnazkkdi9zswmaqyvjn8x7vf4";
    };

    nativeBuildInputs = [ self.makeWrapper ];

    preUnpack = ''
    mkdir src
    cd src
    sourceRoot=.
  '';

    installPhase = ''
    mkdir -p $out/bin
    cd ..
		cp -r src $out/
    ls -al $out/src
    makeWrapper ${self.mono5}/bin/mono $out/bin/omnisharp \
    --add-flags "$out/src/OmniSharp.exe"
  '';

    meta = with self.stdenv.lib; {
      description = "OmniSharp based on roslyn workspaces";
      homepage = "https://github.com/OmniSharp/omnisharp-roslyn";
      platforms = platforms.linux;
      license = licenses.mit;
      maintainers = with maintainers; [ tesq0 ];
    };

  };
}
