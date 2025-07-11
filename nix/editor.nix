# stuff that I typically couple in with my nvim config
{ pkgs, ... }:
with pkgs;
[
  bash-language-server
  # btop # use system package if you want gpu stats
  fish-lsp
  lazydocker
  lazygit
  lazysql
  marksman
  shfmt
  tinymist
  typst
  yaml-language-server
]
