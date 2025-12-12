function man
	if not command -v bat >/dev/null 2>&1
		command man "$argv"
		return
	end
  	command man "$argv" | bat --plain --language=man
end
