{ pkgs, ... }:
let
  cliPackages = import ./cli.nix { inherit pkgs; };
  editorPackages = import ./editor.nix { inherit pkgs; };
  webdevPackages = import ./webdev.nix { inherit pkgs; };
  langPackages = import ./lang/default.nix { inherit pkgs; };
in
  cliPackages
  ++ editorPackages
  ++ webdevPackages
  ++ langPackages