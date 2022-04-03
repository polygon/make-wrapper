{ lib, stdenv, mkwrapper-extract, bash }:

stdenv.mkDerivation rec {
  name = "make-wrapper";

  src = ./src;

  dontConfigure = true;
  dontBuild = true;
  
  installPhase = ''
    mkdir -p $out/scripts
    mkdir -p $out/bin

    cp $src/die.sh $out/scripts
    substitute $src/makeWrapper $out/bin/makeWrapper \
      --subst-var-by bash ${bash}/bin/bash \
      --subst-var-by out $out \
      --subst-var-by mkwrapper-extract ${mkwrapper-extract}
    substitute $src/wrapProgram $out/bin/wrapProgram \
      --subst-var-by bash ${bash}/bin/bash \
      --subst-var-by out $out \
      --subst-var-by mkwrapper-extract ${mkwrapper-extract}
    chmod +x $out/bin/makeWrapper
    chmod +x $out/bin/wrapProgram
  '';
}