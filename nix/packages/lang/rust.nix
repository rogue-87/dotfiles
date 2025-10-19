{ pkgs, ... }:
let
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

in
with pkgs;
[
  rust
  rustlings
  cargo-binstall
  taplo
  pkg-config
  openssl
]
