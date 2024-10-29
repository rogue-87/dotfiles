# my nvim config

<a href="https://dotfyle.com/rogue-87/nvim-cfg"><img src="https://dotfyle.com/rogue-87/nvim-cfg/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/rogue-87/nvim-cfg"><img src="https://dotfyle.com/rogue-87/nvim-cfg/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/rogue-87/nvim-cfg"><img src="https://dotfyle.com/rogue-87/nvim-cfg/badges/plugin-manager?style=flat" /></a>

### Neovim config

![Neovim Config](https://private-user-images.githubusercontent.com/68822497/371301497-3141d3e2-ed5e-4fdf-84d9-c8d191cbab36.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDE0OTctMzE0MWQzZTItZWQ1ZS00ZmRmLTg0ZDktYzhkMTkxY2JhYjM2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTg5NWEyZGFkMTE5OGVjYzVkZDNkZDFkNGMzOTljYTA4ZTYxN2VkNmYyYjEwYmQ4NTM3ZjU1YTczY2I2MzQ3N2ImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.gftz5wTMM5T211iHu0uO8ST2ODO0R_CaXKUjyqtrYOE)

#### what's this neovim config for?

front-end web development(particularly astro + svelte), and a lil bit of golang(still learning it :))

#### Look at that sweet sweet startup time!

![Neovim Startup Time](https://private-user-images.githubusercontent.com/68822497/371301507-7f42f006-4d3c-4295-8334-c3ee67699d29.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDE1MDctN2Y0MmYwMDYtNGQzYy00Mjk1LTgzMzQtYzNlZTY3Njk5ZDI5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTk5ODEzOTBlYTY4NDI5MDY0YTY1ZDcyZDhjMThkM2JiYmFiMWY2ZTBlM2ViNzFkMmFlODRmZTNlNzYwYzI0ZmImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.alMIqLE-VD5TPyK-f_WWZq1rxtMuizDhy6YovHvP0ek)

#### Dashboard menu

Nothing fancy just a normal dashboard

![Editor Showcase](https://private-user-images.githubusercontent.com/68822497/371301333-fa8d7140-cd6f-4c17-affe-562d1c3cf71f.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDEzMzMtZmE4ZDcxNDAtY2Q2Zi00YzE3LWFmZmUtNTYyZDFjM2NmNzFmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTFiOTQ1ZTZmNzdlNGQzN2IwZDczZjk2MWZmYmFhZDUzOTU2YTk5ZWRjMjc0ZmNhMzI1MzI0MTI4NGE3MjA0OGMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0._LQlezKsyFqFAZfkAztb1bFskzNs6daDblJEoDt6E0Q)

#### Treesitter syntax highlighting, autocompletion and debugging!(only js files for now)

![Editor Showcase](https://private-user-images.githubusercontent.com/68822497/371301339-78747ffd-5813-4d68-96cc-19b0f276cc3d.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDEzMzktNzg3NDdmZmQtNTgxMy00ZDY4LTk2Y2MtMTliMGYyNzZjYzNkLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTgyMzg4ZGM2ODBjY2M2OWNlYmE0ODg0MThjODc4YzJlZGY2M2FiODkwODU4MmM5NWQ5ZmJjNWMwYTdiMTMwYzMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.XVHhJ5x0rDq7esmZdnbXzI4CuAR2ErZ9nCxl3TIhqGo)

#### Fuzzy finding with Telescope!

![Editor Showcase](https://private-user-images.githubusercontent.com/68822497/371301344-65d30037-8270-457f-8d05-c9312318810a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDEzNDQtNjVkMzAwMzctODI3MC00NTdmLThkMDUtYzkzMTIzMTg4MTBhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTY3YWIzNDU5NjU4YTViMTcyZDFkYzlkZmQyNTMwMzNiNWY5OTM3ZGVhYjQ1MTBjN2NhNDMwODZmOTQxMzhhOWImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.QBDgiy0VUn-v-W5q4xE0KOLre6m7i3vVM81_n2-mJJo)

### View images using neo-tree!

I personally find this to be a better solution than renedring the image in the terminal.

![Editor Showcase](https://private-user-images.githubusercontent.com/68822497/371301449-e9a56cb2-aa54-4efb-b18a-81a4a0afcc4a.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjczODIwMjIsIm5iZiI6MTcyNzM4MTcyMiwicGF0aCI6Ii82ODgyMjQ5Ny8zNzEzMDE0NDktZTlhNTZjYjItYWE1NC00ZWZiLWIxOGEtODFhNGEwYWZjYzRhLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA5MjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwOTI2VDIwMTUyMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTY1ODY4YmE4ODdlNmY3ZGZlNTc2YzNiYWRlNDczYjdkMDllZTJlMGJhNTY4MzEyZDNjMWQ3NTA3OWQ3Yzk4YmQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.L3e0EVrfhMB9GJoJ8eSkSw2tx9KjbwTKOZhyTgmkILw)

## Install Instructions

> Install requires Neovim 0.10+. Always review the code before installing a configuration.

### there are two ways you can clone this config

#### First option: clone it directly into your neovim config

```sh
git clone git@github.com:rogue-87/nvim-cfg ~/.config/nvim
nvim
```

##### NOTE: don't forget to remove the `.git` folder!

#### Second Option: through NVIM_APPNAME

Paste this somewhere in your shellrc (.bashrc, .zshrc, ...)

```sh
# bash or zsh
alias <command-alias-here>='NVIM_APPNAME=<name of the nvim app> nvim'
```

```fish
# fish
alias <command-alias-here> "NVIM_APPNAME=<name-of-the-nvim-app> nvim"
```

```nu
# nu
def <command-alias-here> [] { NVIM_APPNAME=<name-of-the-nvim-app> nvim }
```

## Plugins

### ai

- [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)

### bars-and-lines

- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
- [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)

### color

- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)

### colorscheme

- [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
- [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)

### comment

- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
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

- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
- [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### media

- [HakonHarnes/img-clip.nvim](https://dotfyle.com/plugins/HakonHarnes/img-clip.nvim)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
- [anuvyklack/animation.nvim](https://dotfyle.com/plugins/anuvyklack/animation.nvim)
- [folke/lazydev.nvim](https://dotfyle.com/plugins/folke/lazydev.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### scrollbar

- [lewis6991/satellite.nvim](https://dotfyle.com/plugins/lewis6991/satellite.nvim)

### session

- [folke/persistence.nvim](https://dotfyle.com/plugins/folke/persistence.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### split-and-window

- [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)

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
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

## Language Servers

- astro
- bashls
- clangd
- cssls
- dartls
- eslint
- gopls
- html
- jsonls
- lua_ls
- svelte

This readme was generated by [Dotfyle](https://dotfyle.com)
