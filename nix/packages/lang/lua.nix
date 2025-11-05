{ pkgs, pkgs-unstable, ... }:
(with pkgs; [
  lua
  lua-language-server
])
++ (with pkgs-unstable; [
  emmylua-check
  emmylua-doc-cli
  emmylua-ls
  lux-cli
  selene
  stylua
])
