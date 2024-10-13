-- keymaps go here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clipboard related stuff
-- DELETE
map({ "n", "v" }, "d", '"_d', opts)
-- DELETE LINE
map("n", "dd", '"_dd', opts)
-- DELETE TILL END OF LINE
map("n", "D", '"_D', opts)

-- CHANGE
map({ "n", "v" }, "c", '"_c', opts)
-- CHANGE LINE
map("n", "cc", '"_cc', opts)
-- CHANGE TILL END OF LINE
map("n", "C", '"_C', opts)

-- CUT
map({ "n", "v" }, "x", "d", opts)
-- CUT LINE
map("n", "xx", "dd", opts)
-- CUT TILL END OF LINE
map("n", "X", "D", opts)

-- SELECT
map({ "n", "v" }, "s", '"_s', opts)
-- SELECT LINE
map("n", "S", '"_S', opts)

-- Placeholders
opts.desc = "code"
map("n", "<leader>c", "", opts)

opts.desc = "File/Find"
map("n", "<leader>f", "", opts)

-- Actual Keymaps
opts.desc = "write"
map("n", "<leader>w", "", opts)

opts.desc = "file"
map("n", "<leader>ww", "<cmd>w<cr>", opts)

opts.desc = "all"
map("n", "<leader>wa", "<cmd>wa<cr>", opts)

opts.desc = "nohlsearch"
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

opts.desc = "quit/session"
map("n", "<leader>q", "", opts)

opts.desc = "quit & save"
map("n", "<leader>qq", "<cmd>wqa<cr>", opts)

opts.desc = "quit witout saving"
map("n", "<leader>qQ", "<cmd>qa!<cr>", opts)

opts.desc = "Lazy"
map("n", "<leader>cl", "<cmd>Lazy<cr>", opts)

opts.desc = "Open remote git repository"
map("n", "<leader>go", function()
  -- Get the Git remote URL
  local handle = io.popen("git config --get remote.origin.url")
  local remote_url
  if handle then
    remote_url = handle:read("*a")
    handle:close()
  end

  -- Remove any newline character
  remote_url:gsub("%s+", "")

  -- Convert SSH remote URLs to HTTPS URLs
  if remote_url:match("^git@") then
    remote_url = remote_url:gsub(":", "/"):gsub("^git@", "https://")
  elseif remote_url:match("^https://") then
    -- HTTPS URLs are fine as is
  else
    print("Unsupported remote URL format: " .. remote_url)
    return
  end

  -- Open the URL in the default browser (for Linux)
  os.execute("xdg-open " .. remote_url)
end, opts)
