return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", "", desc = "Noice"  },
    { "<leader>na", function() require("noice").cmd("all")      end, desc = "All",              },
    { "<leader>nl", function() require("noice").cmd("last")     end, desc = "Last message",     },
    { "<leader>nh", function() require("noice").cmd("history")  end, desc = "Message history",  },
    { "<C-Esc>",
      function() require("noice").cmd("dismiss") end,
      desc = "Dismiss all",
    },
    { "<C-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true, expr = true, desc = "Scroll Forward", mode = { "i", "n", "s" },
    },
    { "<C-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true, expr = true, desc = "Scroll Backward", mode = { "i", "n", "s" },
    },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
  },
}
