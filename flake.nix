{
  description = "dotfiles flake(only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "global pkgs";
        paths = with pkgs; [
          home-manager
          # lua
          lua-language-server
          selene
          stylua
          lux-cli

          # luau
          lune
          luau
          luau-lsp

          # nix
          nixd
          nixfmt-rfc-style

          # rust
          rustup
          taplo
          rustlings

          # python
          pyright
          ruff
          uv

          # java
          jdt-language-server
          gradle
          maven

          # csharp
          dotnet-sdk_9
          roslyn-ls

          # webdev
          prettierd
          typescript-language-server
          vscode-langservers-extracted
          svelte-language-server
          deno
          bun

          # notes
          marksman
          tinymist
          typst

          # other
          bash-language-server
          fish-lsp
          yaml-language-server

          bacon
          bat
          du-dust
          dua
          eza
          hurl
          hyperfine
          mask
          mprocs
          presenterm
          rusty-man
          shfmt
          tokei
          wiki-tui
          wrkflw
          xh
          zoxide
        ];
      };
    };
}
