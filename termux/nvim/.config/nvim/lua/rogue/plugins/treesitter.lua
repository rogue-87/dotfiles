return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- "nushell/tree-sitter-nu",
  },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "elixir",
        "heex",
        "lua",
        "luadoc",
        "luap",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "printf",
        "regex",
        "query",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "xml",
        --
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "astro",
        "svelte",
      },
      modules = {},
      ignore_install = {},
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sd",
        },
      },
    })
  end,
}