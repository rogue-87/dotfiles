if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # paths
    fish_add_path ~/.wakatime
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.spicetify

    # check if mise exists
    # if command -q -v mise >/dev/null
    #     mise activate fish | source
    # end


    # default editor
    set -x EDITOR nvim
    set -x VISUAL nvim

    # browser to be used by flutter
    set -x CHROME_EXECUTABLE chromium-browser
	if command -q -v zoxide >/dev/null
		zoxide init fish | source
	end
end
