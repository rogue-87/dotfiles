if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # default editor
    set -x EDITOR nvim
    set -x VISUAL nvim

    # browser to be used by flutter
    set -x CHROME_EXECUTABLE chromium-browser
end
