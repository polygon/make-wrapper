# make-wrapper extracted

`makeWrapper` and `wrapProgram` are useful tools available in Nixpkgs. Unfortunately, they are not easy to use outside of a Nix based build process. This project wraps `make-wrapper.sh` from Nixpkgs in two scripts that can be run from every shell. Usage is otherwise the same. See here for more documentation:

https://nixos.org/manual/nixpkgs/stable/#fun-makeWrapper

https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh

## Usage

```
nix shell github:polygon/make-wrapper

makeWrapper <executable> <out-path> [<args> ...]
wrapProgram <executable> [<args> ...]