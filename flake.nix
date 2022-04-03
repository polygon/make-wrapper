{
  description = "Standalone version of make-wrapper script from Nixpkgs";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.mkwrapper-extract = pkgs.callPackage ./mkwrapper-extract.nix {
          inherit nixpkgs;
        };
        packages.make-wrapper = pkgs.callPackage ./make-wrapper.nix { 
          mkwrapper-extract = self.packages.${system}.mkwrapper-extract;
        };
      }
    );
}
