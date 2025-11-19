{ pkgs, ... }:
with pkgs;
[
  lua-language-server
  emmylua-check
  emmylua-doc-cli
  emmylua-ls
  lux-cli
  selene
  stylua
]
