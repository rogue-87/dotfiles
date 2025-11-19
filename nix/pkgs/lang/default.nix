{ pkgs, ... }:
let
  java = import ./java.nix { inherit pkgs; };
  lua = import ./lua.nix { inherit pkgs; };
  luau = import ./luau.nix { inherit pkgs; };
  python = import ./python.nix { inherit pkgs; };
in
java ++ lua ++ luau ++ python
