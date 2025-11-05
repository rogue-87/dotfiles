{ pkgs, pkgs-unstable, ... }:
with pkgs;
[
  bun
  pnpm
  deno
  svelte-language-server
  typescript-language-server
  vscode-langservers-extracted
  tailwindcss-language-server
]
