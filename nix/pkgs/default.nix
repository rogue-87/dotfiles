{ pkgs, ... }:
let
  cli = import ./cli.nix { inherit pkgs; };
  editor = import ./editor.nix { inherit pkgs; };
  lang = import ./lang/default.nix { inherit pkgs; };
in
cli ++ editor ++ lang
