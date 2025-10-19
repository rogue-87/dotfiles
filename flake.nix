{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils"; # noice utils
    rust-overlay.url = "github:oxalica/rust-overlay"; # rustup but nixified
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      flake-utils,
      rust-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        pkgs-unstable = import nixpkgs-unstable { inherit system overlays; };
        pkgsCollections = import ./nix/packages { inherit pkgs; };

        deps =
          with pkgs;
          [
            nixd
            nixfmt-rfc-style
            tiny
          ]
          ++ pkgsCollections;

      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfiles";
          paths = deps;
        };
      }
    );
}
