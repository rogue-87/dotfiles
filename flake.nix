{
  description = "dotfiles flake(only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay"; # rustup but nixified
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        # manage rust installation
        rust = pkgs.rust-bin.stable.latest.default.override {
          # components
          extensions = [
            "clippy"
            "rust-analyzer"
            "rust-src"
          ];
          # targets
          # targets = [ ];
        };
      in
      with pkgs;
      {
        packages.default = buildEnv {
          name = "dotfiles-pkgs";
          paths = [
            # nix
            nixd
            nixfmt-rfc-style

            # rust
            rust
            rustlings
            taplo

            # lua
            lua-language-server
            lux-cli
            selene
            stylua

            # luau
            luau
            luau-lsp
            lune

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
      }
    );
}
