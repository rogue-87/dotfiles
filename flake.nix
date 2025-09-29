{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils"; # noice utils
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
      flake-utils,
      rust-overlay,
      system-manager,
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
            zig
            zls
          ]
          ++ pkgsCollections;

      in
      {
        systemConfigs.default = system-manager.lib.makeSystemConfig {
          modules = [
            ./nix/system/default.nix
          ];
        };

        packages.default = pkgs.symlinkJoin {
          name = "dotfiles-packages";
          paths = deps;
        };
      }
    );
}
