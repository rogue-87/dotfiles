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

        cli = import ./nix/cli.nix { inherit pkgs; };
        editor = import ./nix/editor.nix { inherit pkgs; };
        java = import ./nix/java.nix { inherit pkgs; };
        lua = import ./nix/lua.nix { inherit pkgs; };
        luau = import ./nix/luau.nix { inherit pkgs; };
        python = import ./nix/python.nix { inherit pkgs; };
        webdev = import ./nix/webdev.nix { inherit pkgs; };
      in
      {
        packages.default = pkgs.buildEnv {
          name = "dotfiles-pkgs";
          paths =
            with pkgs;
            [
              # nix
              nixd
              nixfmt-rfc-style

              # rust
              rust
              rustlings
              taplo
            ]
            ++ cli
            ++ editor
            # ++ java
            ++ lua
            ++ luau
            # ++ python
            ++ webdev;
        };
      }
    );
}
