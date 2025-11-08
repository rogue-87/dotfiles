{ pkgs, ... }:
let
  # manage rust installation
  rust = pkgs.rust-bin.stable.latest.default.override {
    extensions = [
      "clippy"
      "rust-analyzer"
      "rust-src"
      "rust-docs"
    ];
    # targets that rust can compile to
    targets = [
      "x86_64-unknown-linux-gnu"
      "wasm32-unknown-unknown"
    ];
  };

  rustup-docs = pkgs.writeShellApplication {
    name = "rustup-docs";
    runtimeInputs = [
      rust
      pkgs.xdg-utils
    ];
    text = ''
      #!/usr/bin/env bash
      xdg-open "$(rustc --print sysroot)/share/doc/rust/html/index.html"
    '';
  };

in
with pkgs;
[
  rust
  rustup-docs
  rustlings
  cargo-binstall
  taplo
  # pkg-config
  # openssl
]
