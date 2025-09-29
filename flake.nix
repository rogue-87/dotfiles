{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay"; # rustup but nixified

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        pkgs-unstable = import nixpkgs-unstable { inherit system overlays; };

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

        packs = import ./nix/modules/packages { inherit pkgs; };

        deps =
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
          ++ packs;

      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfiles-pkgs";
          paths = deps;
        };
      }
    );
}
