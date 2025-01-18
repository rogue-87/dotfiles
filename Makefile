LAPTOP = ${HOME}/dotfiles/laptop
TERMUX = ${HOME}/dotfiles/termux
TARGET_DIR = ${HOME}

.PHONY: test laptop-stow laptop-unstow termux-stow termux-unstow

LAPTOP_PACKAGES = nvim neovide git fastfetch kitty fish

TERMUX_PACKAGES = nvim git fastfetch kitty termux-settings bash fish

test:
	@echo $(LAPTOP)
	@echo $(TARGET_DIR)

laptop-stow:
	@echo "Stowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) $(LAPTOP_PACKAGES)

laptop-unstow:
	@echo "Unstowing laptop dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(LAPTOP) -D $(LAPTOP_PACKAGES)

termux-stow:
	@echo "Stowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) $(TERMUX_PACKAGES)

termux-unstow:
	@echo "Unstowing termux dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(TERMUX) -D $(TERMUX_PACKAGES)
