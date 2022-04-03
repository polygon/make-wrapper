{ lib, nixpkgs, stdenv }:

stdenv.mkDerivation rec {
  name = "mkwrapper-extract";

  unpackPhase = ''true'';

  dontConfigure = true;
  dontBuild = true;
  
  installPhase = ''
    mkdir -p $out/scripts
    substitute ${nixpkgs}/pkgs/build-support/setup-hooks/make-wrapper.sh $out/scripts/make-wrapper.sh \
      --subst-var-by shell \$make_wrapper_shell
  '';
}