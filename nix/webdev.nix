{ pkgs, ... }:
with pkgs;
[
  bun
  pnpm
  deno
  prettierd
  svelte-language-server
  typescript-language-server
  vscode-langservers-extracted
  tailwindcss-language-server
]
