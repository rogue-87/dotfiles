LAPTOP = ${HOME}/dotfiles/laptop
TERMUX = ${HOME}/dotfiles/termux
TARGET_DIR = ${HOME}

.PHONY: test stow-laptop unstow-laptop stow-termux unstow-termux

test:
	@echo $(LAPTOP)
	@echo $(TARGET_DIR)

stow-laptop:
	@echo "Stowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) nvim nushell git fastfetch kitty bash

unstow-laptop:
	@echo "Unstowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) -D nvim nushell git fastfetch kitty bash

stow-termux:
	@echo "Stowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) nvim nushell git fastfetch kitty termux-settings bash-profile

unstow-termux:
	@echo "Unstowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) -D nvim nushell git fastfetch kitty termux-settings bash-profile
