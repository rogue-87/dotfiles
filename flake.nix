{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # (0.1) means unstable
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
        overlays = [ rust-overlay.overlays.default ];
        pkgs = import nixpkgs { inherit system overlays; };
        pkgs-unstable = import nixpkgs-unstable { inherit system overlays; };
        pkgsCollections = import ./nix/packages { inherit pkgs pkgs-unstable; };
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfiles";
          paths =
            with pkgs;
            [
              nixd
              nixfmt-rfc-style
              gdtoolkit_4
            ]
            ++ pkgsCollections;
        };
      }
    );
}
