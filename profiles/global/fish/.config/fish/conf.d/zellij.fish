if command -q -v zellij >/dev/null && status is-interactive
	eval (zellij setup --generate-auto-start fish | string collect)
end
