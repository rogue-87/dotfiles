## my dotfiles nothing special

### Neovim config

![Neovim Config](./readme-stuff/nvim-config.png)

#### what's this neovim config for?

front-end webdev and also golang

#### Look at that sweet sweet startup time :p

![Neovim Startup Time](./readme-stuff/nvim-startup-time.png)

## Setup

#### shellscript

```bash
bash setup.sh
```

#### manual

- Install [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)

- install [glow](https://github.com/charmbracelet/glow?tab=readme-ov-file#installation)

- install theses packages(most likely available in the distro repo)

```
  neovim kitty fastfetch btop cava ncmpcpp mpd ranger lazygit stow npm nodejs python3 pip lua luarocks gloang rust
```

- install these npm packages(required by some neovim plugins)

```
  neovim yarn pnpm browser-sync vscode-langservers-extracted typescript typescript-language-server @vue/language-server @vue/typescript-plugin
```

- finally, run stow command(make sure you're in the dotfiles dir!)

```bash
stow .
```

- **done!**
