{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
        pkgs = import nixpkgs {
          inherit system overlays;
          config = {
            allowUnfree = true;
          };
        };

        # manage rust installation
        rust = pkgs.rust-bin.stable.latest.default.override {
          extensions = [
            "clippy"
            "rust-analyzer"
            "rust-src"
          ];
          # targets that rust can compile to
          targets = [
            "x86_64-unknown-linux-gnu"
            "wasm32-unknown-unknown"
          ];
        };

        cli = import ./nix/cli.nix { inherit pkgs; };
        editor = import ./nix/editor.nix { inherit pkgs; };
        java = import ./nix/lang/java.nix { inherit pkgs; };
        lua = import ./nix/lang/lua.nix { inherit pkgs; };
        luau = import ./nix/lang/luau.nix { inherit pkgs; };
        python = import ./nix/lang/python.nix { inherit pkgs; };
        webdev = import ./nix/webdev.nix { inherit pkgs; };
      in
      {
        packages.default = pkgs.buildEnv {
          name = "dotfiles-pkgs";
          paths =
            with pkgs;
            [
              nixd
              nixfmt-rfc-style
              rust
              rustlings
              taplo
              cargo-binstall
              tiny
              zig
              zls
            ]
            ++ cli
            ++ editor
            ++ lua
            ++ luau
            ++ webdev;
        };
      }
    );
}
