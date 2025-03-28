if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    set -Ux EDITOR nvim
    set -Ux VISUAL nvim

	# browser to be used by flutter
	set -x CHROME_EXECUTABLE chromium-browser

	# check if mise exists
    if command -q -v mise >/dev/null
        mise activate fish | source
    end
end
