#!/bin/bash

# Clean up script used to undo what setup.sh does, for testing purposes.

BREW=$(which brew)
ITERM_CONFIG_DIR="${HOME}/.iterm2"
K9S_CONFIG_PATH="${HOME}/Library/Application Support/k9s"
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

# Remove zshrc 
rm -f "${HOME}/.zshrc.bak"
rm -f "${HOME}/.zshrc"

# Remove zsh plugins
rm "${ZSH_CUSTOM}/plugins/"

# Remove and configure p10k
rm -f "${HOME}/.p10k.zsh.bak"
rm -f "${HOME}/.p10k.zsh"

# Delete k9s catpuccin theme
rm -fr "${K9S_CONFIG_PATH}/skins"
rm -f "${K9S_CONFIG_PATH}/skin.yml"

# Configure neovim
rm -fr "${HOME}/.config/nvim"

# Clean up iTerm
rm -fr "${ITERM_CONFIG_DIR}"
#rm -fr "${HOME}/Library/Application Support/iTerm2"
#rm -fr "${HOME}/Library/Saved Application State/com.googlecode.iterm2.savedState"
#rm -fr /Applications/iTerm.app

# Delete  alias.zsh
rm "${ZSH_CUSTOM}/alias.zsh"

# Uninstall Brew formulas and casks
$BREW uninstall --force --zap $("${BREW}" list)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# Uninstall oh-my-zsh
command env ZSH="$ZSH" sh "$ZSH/tools/uninstall.sh"

# Restore bash as login shell
/usr/bin/chsh -s /bin/bash

exit 0
