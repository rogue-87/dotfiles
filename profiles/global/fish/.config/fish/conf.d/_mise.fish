# should be named _mise.fish so it can be loaded first
# before other fish files in conf.d

if command -q -v mise >/dev/null
	mise activate fish | source
end
