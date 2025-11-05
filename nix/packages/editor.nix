# stuff that I typically couple in with my nvim config
{ pkgs, pkgs-unstable, ... }:
with pkgs;
[
  bash-language-server
  fish-lsp
  marksman
  shfmt
  tinymist
  typst
  typstyle
  websocat
  yaml-language-server
]
