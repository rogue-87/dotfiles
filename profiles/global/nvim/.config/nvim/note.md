# My Neovim Config

Supported Programming Languages

| Language   |  Language Server   | Formatter |      Linter      |      Debugger      |
| :--------- | :----------------: | :-------: | :--------------: | :----------------: |
| c/cpp      |       clangd       |    LSP    |                  |                    |
| csharp     |     omnisharp      |    LSP    |                  |     netcoredbg     |
| dart       |     `builtin`      | `buildin` |                  |                    |
| fish       |      fish-lsp      |    LSP    |                  |                    |
| java       |       jdtls        |    LSP    |                  |                    |
| lua        |       luals        |  stylua   |      selene      |                    |
| python     |      pyright       |   ruff    |       ruff       |                    |
| rust       |   rust-analyzer    |  rustfmt  |      clippy      | lldb `or` codelldb |
| javascript | tsserver `or` deno | prettierd | eslint `or` deno |                    |
| typescript | tsserver `or` deno | prettierd | eslint `or` deno |                    |

Other Supported Languages(markup, sql, etc...)

| Language |   LSP    |      Formatter      |
| :------: | :------: | :-----------------: |
|  svelte  |  svelte  |         LSP         |
| markdown | marksman | prettierd `or` deno |
|   json   |  jsonls  | prettierd `or` deno |

# dotfiles/profiles/laptop/nvim/.config/nvim

<a href="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim"><img src="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim"><img src="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim"><img src="https://dotfyle.com/rogue-87/dotfiles-profiles-laptop-nvim-config-nvim/badges/plugin-manager?style=flat" /></a>

## Plugins

### bars-and-lines

- [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)

### color

- [catgoose/nvim-colorizer.lua](https://dotfyle.com/plugins/catgoose/nvim-colorizer.lua)

### colorscheme

- [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
- [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
- [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)

### comment

- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### editing-support

- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### icon

- [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)
- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### indent

- [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [mrcjkb/rustaceanvim](https://dotfyle.com/plugins/mrcjkb/rustaceanvim)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### nvim-dev

- [folke/lazydev.nvim](https://dotfyle.com/plugins/folke/lazydev.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### scrollbar

- [lewis6991/satellite.nvim](https://dotfyle.com/plugins/lewis6991/satellite.nvim)

### session

- [folke/persistence.nvim](https://dotfyle.com/plugins/folke/persistence.nvim)

### snippet

- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)

### tabline

- [nanozuki/tabby.nvim](https://dotfyle.com/plugins/nanozuki/tabby.nvim)

### terminal-integration

- [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)

### test

- [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)

### utility

- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

This readme was generated by [Dotfyle](https://dotfyle.com)
