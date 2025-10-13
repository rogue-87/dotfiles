{ pkgs, ... }:
let
  java = import ./java.nix { inherit pkgs; };
  lua = import ./lua.nix { inherit pkgs; };
  luau = import ./luau.nix { inherit pkgs; };
  python = import ./python.nix { inherit pkgs; };
  rust = import ./rust.nix { inherit pkgs; };
  zig = import ./zig.nix { inherit pkgs; };
in
  java
  ++ lua
  ++ luau
  ++ python
  ++ rust
  ++ zig
