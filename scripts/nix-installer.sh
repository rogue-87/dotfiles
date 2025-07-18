#!/usr/bin/env bash
set -euo pipefail

YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NORMAL='\033[0m'

usage() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

install() {
    echo "Installing..."
    echo -e "${YELLOW}Installing Nix...${NORMAL}"
    sleep 2s
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
    echo -e "${GREEN}Nix installed successfully!${NORMAL}"
    echo
}

uninstall() {
    echo "Uninstalling..."
    echo -e "${YELLOW}Uninstalling Nix...${NORMAL}"
    sleep 2s
    /nix/nix-installer uninstall
    echo -e "${GREEN}Nix uninstalled successfully!${NORMAL}"
    echo
}

if [ $# -lt 1 ]; then
    usage
fi

case "$1" in
install) install ;;
uninstall) uninstall ;;
*)
    echo "Error: Unknown command '$1'"
    usage
    ;;
esac
