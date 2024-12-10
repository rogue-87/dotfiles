LAPTOP = ${HOME}/dotfiles/laptop
TERMUX = ${HOME}/dotfiles/termux
TARGET_DIR = ${HOME}

.PHONY: test stow-laptop unstow-laptop stow-termux unstow-termux

test:
	@echo $(LAPTOP)
	@echo $(TARGET_DIR)

stow-laptop:
	@echo "Stowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) nvim git fastfetch kitty bash neovide

unstow-laptop:
	@echo "Unstowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) -D nvim git fastfetch kitty bash neovide

stow-termux:
	@echo "Stowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) nvim git fastfetch kitty termux-settings bash

unstow-termux:
	@echo "Unstowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) -D nvim git fastfetch kitty termux-settings bash
