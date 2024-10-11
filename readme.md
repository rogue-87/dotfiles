## my dotfiles nothing special

## Setup

#### shellscript (Fedora only)

```bash
./setup.sh
```

##### Notes

- The path for globally installed npm packages is ~/.npm/packages/ (I don't like using sudo for stuff like this)

#### manual

- Install [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)

- install these packages(most likely available in the distro repo)

```
  neovim kitty fastfetch btop cava ncmpcpp mpd lazygit stow npm nodejs python3 pip lua luarocks gloang rust
```

- install these npm packages(required by some neovim plugins)

```
  neovim yarn pnpm browser-sync
```

- finally, run stow command(make sure you're in the dotfiles dir!)

```bash
make stow
```

- **done!**
