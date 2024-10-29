return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
}
