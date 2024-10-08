DOTFILES_DIR = ${HOME}/dotfiles
TARGET_DIR = ${HOME}

.PHONY: test stow unstow

test:
	@echo $(DOTFILES_DIR)
	@echo $(TARGET_DIR)

stow:
	@echo "Stowing dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(DOTFILES_DIR) nvim nushell git fastfetch kitty

unstow:
	@echo "Unstowing dotfiles..."
	stow --target=$(TARGET_DIR) --dir=$(DOTFILES_DIR) -D nvim nushell git fastfetch kitty

