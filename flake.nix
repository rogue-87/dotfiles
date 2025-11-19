{
  description = "dotfiles flake (only for installing cli/tui tools)";

  inputs = {
    # /0 for stable
    # /0.1 for unstable
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    flake-utils.url = "github:numtide/flake-utils"; # noice utils
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgsCollections = import ./nix/pkgs { inherit pkgs; };
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
