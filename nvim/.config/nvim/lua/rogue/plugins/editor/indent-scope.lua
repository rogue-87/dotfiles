return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufWritePost", "BufNewFile" },
    opts = {
      draw = {
        delay = 0,
        animation = function()
          return 0
        end,
      },
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "noice",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufWritePost", "BufNewFile" },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "alpha",
          "help",
          "neo-tree",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    },
  },
}
