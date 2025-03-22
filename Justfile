# set shell := ["fish", "-c"]

# profiles
laptop := "$PWD/profiles/laptop"
termux := "$PWD/profiles/termux"

# stow packages
laptop_packages := "btop  fastfetch  fish  git  kitty  mise  neovide  nvim  rio  xplr  zed  zellij"
termux_packages := "bash  fastfetch  fish  git  nvim  termux-settings"

# where to put these packages
target := "$HOME"

help:
    @just --list

info:
    @echo "  available profiles {{BLUE}} {{NORMAL}}:"
    @echo "  {{YELLOW}}laptop termux{{NORMAL}}"
    @echo 
    @echo "  laptop packages {{BLUE}} {{NORMAL}}:"
    @echo "  {{GREEN}}{{laptop_packages}}{{NORMAL}}"
    @echo
    @echo "  termux packages {{BLUE}} {{NORMAL}}:"
    @echo "  {{GREEN}}{{termux_packages}}{{NORMAL}}"
    @echo 
    @echo "  target directory {{BLUE}} {{NORMAL}}: {{GREEN}}{{target}}{{NORMAL}}"

stow target:
    #!/bin/env bash
    set -euo pipefail

    if [[ "{{target}}" == "laptop" ]]; then
        printf "{{YELLOW}} Stowing dotfiles for laptop... {{NORMAL}}"
        stow --target={{target}} --dir={{laptop}} {{laptop_packages}}
    elif [[ "{{target}}" == "termux" ]]; then
        printf "{{YELLOW}} Stowing dotfiles for termux... {{NORMAL}}"
        stow --target={{target}} --dir={{termux}} {{termux_packages}}
    else
        echo "Unknown target: {{target}}"
        exit 1
    fi
    printf "{{GREEN}} dotfiles ready! {{NORMAL}}"

unstow:
    #!/bin/env bash
    set -euo pipefail

    if [[ "{{os()}}" == linux ]]; then
        printf "{{YELLOW}} unstowing linux {{NORMAL}}\n"
        stow --target={{target}} --dir={{laptop}} -D {{laptop_packages}}
    elif [[ "{{os()}}" == android ]]; then
        printf "{{YELLOW}} unstowing termux {{NORMAL}}\n"
        stow --target={{target}} --dir={{termux}} -D {{termux_packages}}
    fi
    printf "{{GREEN}} dotfiles unstowed successfully! {{NORMAL}}\n"
