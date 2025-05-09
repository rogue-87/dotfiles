# profiles
global := env('PWD') + "/profiles/global" # configs that can be shared accross mutiple devices
laptop := env('PWD') + "/profiles/laptop"
termux := env('PWD') + "/profiles/termux"

# stow configs
global_configs := "fastfetch fish git" 
laptop_configs := "kitty neovide nvim rio zed zellij"
termux_configs := "nvim termux-settings"

# where to put these configs
target := env('HOME')

# recipes
help:
    @just --list

info:
    @echo "  {{BLUE}} {{NORMAL}} global profile:"
    @echo "    {{YELLOW}}{{termux}}{{NORMAL}}"
    @echo
    @echo "  {{BLUE}} {{NORMAL}} available profiles:"
    @echo "  {{YELLOW}}"
    @echo "    laptop: {{laptop}}"
    @echo "    termux: {{termux}}"
    @echo "  {{NORMAL}}"
    
    @echo "  {{BLUE}} {{NORMAL}} global configs:"
    @echo "    {{GREEN}}{{global_configs}}{{NORMAL}}"
    @echo
    @echo "  {{BLUE}} {{NORMAL}} laptop configs:"
    @echo "    {{GREEN}}{{laptop_configs}}{{NORMAL}}"
    @echo
    @echo "  {{BLUE}} {{NORMAL}} termux configs:"
    @echo "    {{GREEN}}{{termux_configs}}{{NORMAL}}"
    @echo 
    @echo "  {{BLUE}} {{NORMAL}} target directory: {{GREEN}}{{target}}{{NORMAL}}"

stow:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ "{{os()}}" == linux ]]; then

        printf "{{YELLOW}} Stowing dotfiles for laptop... {{NORMAL}}\n"
        stow --target={{target}} --dir={{global}} {{global_configs}}
        stow --target={{target}} --dir={{laptop}} {{laptop_configs}}

    elif [[ "{{os()}}" == android ]]; then

        printf "{{YELLOW}} Stowing dotfiles for termux... {{NORMAL}}\n"
        stow --target={{target}} --dir={{global}} {{global_configs}}
        stow --target={{target}} --dir={{termux}} {{termux_configs}}

    else

        echo "Unknown error"
        exit 1

    fi
    printf "{{GREEN}} dotfiles ready! {{NORMAL}}\n"

unstow:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ "{{os()}}" == linux ]]; then

        printf "{{YELLOW}} unstowing linux {{NORMAL}}\n"
        stow --target={{target}} --dir={{global}} -D {{global_configs}}
        stow --target={{target}} --dir={{laptop}} -D {{laptop_configs}}

    elif [[ "{{os()}}" == android ]]; then

        printf "{{YELLOW}} unstowing termux {{NORMAL}}\n"
        stow --target={{target}} --dir={{termux}} -D {{termux_configs}}

    fi
    printf "{{GREEN}} dotfiles unstowed successfully! {{NORMAL}}\n"

nix-installer CMD:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ "{{CMD}}" == "install" ]]; then

        printf "{{YELLOW}} installing nix... {{NORMAL}}\n"
        sleep 2s
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
        printf "{{GREEN}} successfully installed nix! {{NORMAL}}\n"

    elif [[ "{{CMD}}" == "uninstall" ]]; then

        printf "{{YELLOW}} uninstalling nix... {{NORMAL}}\n"
        sleep 2s
        /nix/nix-installer uninstall
        printf "{{GREEN}} successfully uninstalled nix! {{NORMAL}}\n"

    fi

install-rust:
    sudo dnf in rust rustfmt rust-analyzer clippy cargo
