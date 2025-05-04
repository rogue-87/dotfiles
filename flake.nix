{
  description = "dotfiles flake(only for installing cli/tui tools)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "global pkgs";
        paths = with pkgs; [
          # lua stuff
          lua-language-server
          # selene
          stylua

          # nix stuff
          nixd
          nixfmt-rfc-style

          # rust stuff
          taplo

          # notes & stuff
          marksman
          tinymist
          typst

          # other
          bash-language-server
          fish-lsp
          prettierd
          shfmt
          vscode-langservers-extracted
          httpie
          hurl
        ];
      };
    };
}
