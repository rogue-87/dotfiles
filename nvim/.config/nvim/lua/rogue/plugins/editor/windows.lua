return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  lazy = false,
  keys = {
    { "<c-w>z", "<cmd>WindowMaximize<cr>", desc = "Maximize Window" },
    { "<c-w>_", "<cmd>WindowsMaximizeVertically<cr>", desc = "Maximize Window Vertically" },
    { "<c-w>|", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Maximize Window Horizontally" },
    { "<c-w>=", "<cmd>WindowsEqualize<cr>", desc = "Maximize Window Equalize" },
  },
  init = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
  end,
  opts = {
    ignore = {
      buftype = { "quickfix" },
      filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
    },
  },
}
