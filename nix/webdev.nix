{ pkgs, ... }:
with pkgs;
[
  bun
  deno
  prettierd
  svelte-language-server
  typescript-language-server
  vscode-langservers-extracted
]
