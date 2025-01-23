## my dotfiles!

I use [gnu stow](https://www.gnu.org/software/stow/) to manage to my dotfiles

I find it very easy and simple to use for basic dotfile setup

### setup instructions

clone this repository

```sh
git clone https://github.com/rogue-87/dotfiles.git
```

then use `make` to run stow. here's what you can do

```sh
# setup dotfiles for laptop
make laptop-stow
# remove laptop dotfiles
make laptop-unstow
# setup dotfiles for termux(android terminal emulator)
make termux-stow
# remove termux dotfiles
make termux-unstow
```

tada!, you're good to go :]

### extra stuff

[laptop nvim config](https://github.com/rogue-87/dotfiles/blob/master/profiles/laptop/nvim/.config/nvim/note.md)

[termux nvim config](https://github.com/rogue-87/dotfiles/blob/master/profiles/termux/nvim/.config/nvim/note.md)
