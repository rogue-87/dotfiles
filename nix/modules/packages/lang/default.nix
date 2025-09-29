{ pkgs, ... }:
let
  javaPackages = import ./java.nix { inherit pkgs; };
  luaPackages = import ./lua.nix { inherit pkgs; };
  luauPackages = import ./luau.nix { inherit pkgs; };
  pythonPackages = import ./python.nix { inherit pkgs; };
  rustPackages = import ./rust.nix {inherit pkgs;};
in
  javaPackages
  ++ luaPackages
  ++ luauPackages
  ++ pythonPackages
  ++ rustPackages
