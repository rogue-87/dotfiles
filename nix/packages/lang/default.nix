{ pkgs, pkgs-unstable, ... }:
let
  java = import ./java.nix { inherit pkgs pkgs-unstable; };
  lua = import ./lua.nix { inherit pkgs pkgs-unstable; };
  luau = import ./luau.nix { inherit pkgs pkgs-unstable; };
  python = import ./python.nix { inherit pkgs pkgs-unstable; };
  rust = import ./rust.nix { inherit pkgs pkgs-unstable; };
  zig = import ./zig.nix { inherit pkgs pkgs-unstable; };
in
java ++ lua ++ luau ++ python ++ rust ++ zig
