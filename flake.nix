{
  description = "dotfiles flake(only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "global pkgs";
        paths = with pkgs; [
          # nix
          nixd
          nixfmt-rfc-style

          # lua
          lua-language-server
          lux-cli
          selene
          stylua

          # luau
          luau
          luau-lsp
          lune

          # rust
          rustlings
          rustup
          taplo

          # python
          pyright
          ruff
          uv

          # java
          gradle
          jdt-language-server
          maven

          # webdev
          bun
          deno
          prettierd
          svelte-language-server
          typescript-language-server
          vscode-langservers-extracted

          # text editor stuff
          bash-language-server
          fish-lsp
          marksman
          shfmt
          tinymist
          typst
          yaml-language-server

          # other
          bat
          du-dust
          dua
          eza
          hurl
          hyperfine
          mask
          mprocs
          rusty-man
          tokei
          wiki-tui
          wrkflw
          xh
          zoxide
        ];
      };
    };
}
