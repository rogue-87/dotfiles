#!/bin/bash

## lazygit copr repo
sudo dnf copr enable atim/lazygit -y

## packages list
packages=(
  kitty
  neovim
  fastfetch
  stow
  btop
  cava
  lazygit
  npm
  nodejs
  python3
  pip
  lua
  luarocks
  rust
  fish
)

## npm packages(required by neovim plugins)
npm_g_packages=(
  all-the-package-names
  browser-sync
  neovim
  pnpm
  yarn
)

## set up path for global npm packages
PREFIX="$HOME/.npm/packages"
if [ ! -d "$PREFIX" ]; then
  echo "Creating prefix directory: $PREFIX"
  mkdir -p "$PREFIX"
fi
npm config set prefix "$PREFIX"
echo "Global npm prefix set to: $PREFIX"

# install packages
sudo dnf install "${packages[@]}"
npm i -g "${npm_g_packages[@]}"

# bak up .bashrc just in case :)
mv $HOME/.bashrc $HOME/.bashrc.bak
