return { -- Lsp Config
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
      cmd = "Mason",
      keys = {
        { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
      },
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "antosha417/nvim-lsp-file-operations", dependencies = { "nvim-lua/plenary.nvim", "nvim-neo-tree/neo-tree.nvim" }, opts = {} },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local msn_lspconf = require("mason-lspconfig")

    -- MANUALLY INSTALLED LSPs
    lspconfig["nushell"].setup({})
    lspconfig["lua_ls"].setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- LSPs INSTALLED & MANAGED BY MASON.NVIM
    msn_lspconf.setup({
      -- LSPs
      ensure_installed = {
        "bashls",
        "html",
        "cssls",
        "ts_ls",
        "jsonls",
        "astro",
        "emmet_language_server",
      },
      automatic_installation = false,
      handlers = {
        -- DEFAULT CONFIG FOR ALL SERVERS
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
        ["html"] = function()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          lspconfig["html"].setup({ capabilities = capabilities })
        end,
        ["cssls"] = function()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          lspconfig["cssls"].setup({ capabilities = capabilities })
        end,
        ["css_variables"] = function()
          lspconfig["css_variables"].setup({})
        end,
        ["emmet_language_server"] = function()
          lspconfig["emmet_language_server"].setup({})
        end,
        ["ts_ls"] = function()
          lspconfig["ts_ls"].setup({})
        end,
        ["astro"] = function()
          lspconfig["astro"].setup({})
        end,
        ["jsonls"] = function()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          lspconfig["jsonls"].setup({
            filetypes = { "json", "jsonc" },
            capabilities = capabilities,
            settings = {
              json = {
                -- Schemas https://www.schemastore.org
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
        ["eslint"] = function()
          lspconfig["eslint"].setup({
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        map("n", "<leader>cR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        map("n", "<leader>cgd", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        map("n", "<leader>cgD", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        map("n", "<leader>cTi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        map("n", "<leader>cTd", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Show line diagnostics"
        map("n", "<leader>cd", vim.diagnostic.open_float, opts)

        opts.desc = "Show buffer diagnostics"
        map("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "See available code actions"
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        map("n", "<leader>crn", vim.lsp.buf.rename, opts)

        opts.desc = "Show documentation for what is under cursor"
        map("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Lsp Help Signature"
        map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        opts.desc = "Go to previous diagnostic"
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Go to next diagnostic"
        map("n", "]d", vim.diagnostic.goto_next, opts)
      end,
    })
  end,
}
