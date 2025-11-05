{ pkgs, pkgs-unstable,... }:
let
  cliPackages = import ./cli.nix { inherit pkgs pkgs-unstable; };
  editorPackages = import ./editor.nix { inherit pkgs pkgs-unstable; };
  webdevPackages = import ./webdev.nix { inherit pkgs pkgs-unstable; };
  langPackages = import ./lang/default.nix { inherit pkgs pkgs-unstable; };
in
  cliPackages
  ++ editorPackages
  ++ webdevPackages
  ++ langPackages
