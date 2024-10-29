---@param expr string
---@return string
--- returns "<cmd>" .. expr .. "<cr>"
_G.vimexpr = function(expr)
  return "<cmd>" .. expr .. "<cr>"
end

---@param expr string
---@return string
--- returns "<cmd>lua " .. expr .. "<cr>"
_G.luaexpr = function(expr)
  return "<cmd>lua " .. expr .. "<cr>"
end

local ascii = {
  ["rogue"] = {
    [[            :::::::::       ::::::::       ::::::::      :::    :::       ::::::::::    ]],
    [[           :+:    :+:     :+:    :+:     :+:    :+:     :+:    :+:       :+:            ]],
    [[          +:+    +:+     +:+    +:+     +:+            +:+    +:+       +:+             ]],
    [[         +#++:++#:      +#+    +:+     :#:            +#+    +:+       +#++:++#         ]],
    [[        +#+    +#+     +#+    +#+     +#+   +#+#     +#+    +#+       +#+               ]],
    [[       #+#    #+#     #+#    #+#     #+#    #+#     #+#    #+#       #+#                ]],
    [[      ###    ###      ########       ########       ########        ##########          ]],
  },
}

local plugin = {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = ascii["rogue"]
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <cr>"),

      dashboard.button("f", "󰍉  Find files", luaexpr("require('telescope.builtin').find_files({ hidden = true })")),

      dashboard.button("s", "  Open last session", luaexpr("require('persistence').load({ last = true })")),

      dashboard.button("r", "  recent sessions", luaexpr("require('persistence').select()")),

      dashboard.button("l", "󰒲  Open lazy menu", "<cmd>Lazy<cr>"),

      dashboard.button("m", "󱌣  Open mason menu", "<cmd>Mason<cr>"),
      -- stylua: ignore
      dashboard.button("c", "  Go to dotfiles dir", luaexpr("vim.fn.chdir(vim.fn.stdpath('config'))") .. luaexpr("require('telescope.builtin').find_files({ hidden = true })")),

      dashboard.button("h", "󰓙  Run healthcheck", "<cmd>checkhealth<cr>"),

      dashboard.button("q", "󰗼  Quit Neovim", "<cmd>qa<cr>"),
    }
    alpha.setup(dashboard.config)

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "󱐌 Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

return plugin
