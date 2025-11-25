function man
  if not command -v bat >/dev/null 2>&1
    # Fallback to the original man if bat is not available
    command man "$argv"
    return
  end
  # Override: highlight man pages with bat
  command man "$argv" | bat --plain --language=man
end
