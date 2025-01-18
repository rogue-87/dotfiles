# My Neovim Config

Supported Programming Languages

| Language   |      Language Server       |     Formatter      | Linter |     Debugger     |
| :--------- | :------------------------: | :----------------: | :----: | :--------------: |
| c/cpp      |           clangd           |        LSP         |        |     codelldb     |
| csharp     |         omnisharp          |        LSP         |        |    netcoredbg    |
| dart       |    dart language-server    |        LSP         |        |                  |
| fish       |          fish-lsp          |        LSP         |        |                  |
| golang     |           gopls            |     gofmt,LSP      |        |      delve       |
| java       |           jdtls            |        LSP         |        |                  |
| kotlin     |   kotlin-language-server   |                    |        |                  |
| lua        |    lua-language-server     |       stylua       | selene |                  |
| luau       |          luau-lsp          |       stylua       | selene |                  |
| php        |        intelephense        |        LSP         |        |                  |
| python     |          pyright           | ruff, black, isort |  ruff  |     debugpy      |
| rust       |       rust-analyzer        |    rustfmt, LSP    |        |     codelldb     |
| javascript | typescript-language-server |      prettier      | eslint | js-debug-adapter |
| typescript | typescript-language-server |      prettier      | eslint |       deno       |

Supported Other Languages(markup, sql, etc...)

|   Language    |                            LSP                            | Formatter |
| :-----------: | :-------------------------------------------------------: | :-------: |
|     astro     |                         astro-ls                          |    LSP    |
|    svelte     |                       svelteserver                        |    LSP    |
|   markdown    |                          `NONE`                           | prettier  |
| css/scss/less | vscode-css-language-server, css-variables-language-server | prettier  |
