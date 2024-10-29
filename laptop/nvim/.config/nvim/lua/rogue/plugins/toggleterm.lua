return {
  "akinsho/toggleterm.nvim",
  event = { "VeryLazy" },
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      open_mapping = [[<c-`>]],
      start_in_insert = true,
      shade_filetypes = { "neo-tree" },
      direction = "float",
      float_opts = {
        border = "single",
      },
    })

    -- TERMINAL PROGRAMS
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "single",
        width = 180,
        height = 38,
      },
    })

    local glow = Terminal:new({
      cmd = "glow",
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "single",
        width = 180,
        height = 38,
      },
    })

    local btop = Terminal:new({
      cmd = "btop",
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "single",
        width = 180,
        height = 38,
      },
    })

    local cmd = vim.api.nvim_create_user_command
    local map = vim.keymap.set
    -- COMMANDS
    -- stylua: ignore
    cmd("LazyGit", function() lazygit:toggle() end, { desc = "lazygit" })
    -- stylua: ignore
    cmd("Glow",   function() glow:toggle() end, { desc = "glow" })
    -- stylua: ignore
    cmd("Btop", function() btop:toggle() end, { desc = "btop" })

    -- KEYMAPS FOR TERMINAL PROGRAMS
    local opts = { noremap = true, silent = true }
    opts.desc = "Run Terminal Programs"
    map("n", "<leader>r", "", opts)

    opts.desc = "Lazygit"
    -- stylua: ignore
    map("n", "<leader>rl", function() lazygit:toggle() end, opts)

    opts.desc = "Glow"
    -- stylua: ignore
    map("n", "<leader>rg", function() glow:toggle() end, opts)

    opts.desc = "Btop"
    -- stylua: ignore
    map("n", "<leader>rb", function() btop:toggle() end, opts)
  end,
}
