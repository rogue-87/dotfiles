if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Homebrew/Linuxbrew shellenv
    set --global --export HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set --global --export HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set --global --export HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    fish_add_path --global --move --path "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
    if test -n "$MANPATH[1]"
        set --global --export MANPATH '' $MANPATH
    end
    if not contains "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
        set --global --export INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
    end

    # brew completions
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

	# flutter
	set -x CHROME_EXECUTABLE chromium-browser
end
