if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # paths
    fish_add_path ~/.cargo/bin

    # default editor
    set -x EDITOR nvim
    set -x VISUAL nvim

    # source mise if it exists
    if type -q mise
        mise activate fish | source
    end

    # browser to be used by flutter
    set -x CHROME_EXECUTABLE chromium-browser
end
