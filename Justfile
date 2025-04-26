# profiles
laptop := env('PWD') + "/profiles/laptop"
termux := env('PWD') + "/profiles/termux"

# stow packages
laptop_packages := "fastfetch fish git kitty mise neovide nvim rio xplr zed zellij"
termux_packages := "fastfetch fish git nvim termux-settings"

# where to put these packages
target := env('HOME')

# recipes
help:
    @just --list

info:
    @echo "  available profiles {{BLUE}} {{NORMAL}}:"
    @echo "  {{YELLOW}}"
    @echo "  laptop: {{laptop}}"
    @echo "  termux: {{termux}}"
    @echo "  {{NORMAL}}"
    
    @echo "  laptop packages {{BLUE}} {{NORMAL}}:"
    @echo "  {{GREEN}}{{laptop_packages}}{{NORMAL}}"
    @echo
    @echo "  termux packages {{BLUE}} {{NORMAL}}:"
    @echo "  {{GREEN}}{{termux_packages}}{{NORMAL}}"
    @echo 
    @echo "  target directory {{BLUE}} {{NORMAL}}: {{GREEN}}{{target}}{{NORMAL}}"

stow:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ "{{os()}}" == linux ]]; then

        printf "{{YELLOW}} Stowing dotfiles for laptop... {{NORMAL}}\n"
        stow --target="{{target}}" --dir="{{laptop}}" {{laptop_packages}}

    elif [[ "{{os()}}" == android ]]; then

        printf "{{YELLOW}} Stowing dotfiles for termux... {{NORMAL}}\n"
        stow --target="{{target}}" --dir="{{termux}}" {{termux_packages}}

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
        stow --target={{target}} --dir={{laptop}} -D {{laptop_packages}}

    elif [[ "{{os()}}" == android ]]; then

        printf "{{YELLOW}} unstowing termux {{NORMAL}}\n"
        stow --target={{target}} --dir={{termux}} -D {{termux_packages}}

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
