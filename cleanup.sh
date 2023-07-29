#!/bin/bash

# Clean up script used to undo what setup.sh does, for testing purposes.

if [[ $(uname -m) == 'arm64' ]]; then
  BREW="/opt/homebrew/bin/brew"
else
  BREW="/usr/local/bin/brew"
fi

ITERM_CONFIG_DIR="${HOME}/.iterm2"
K9S_CONFIG_PATH="${HOME}/Library/Application Support/k9s"
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
ZSH="${HOME}/.oh-my-zsh"

# Uninstall oh-my-zsh
command env ZSH="$ZSH" sh "$ZSH/tools/uninstall.sh"

# Remove zshrc 
rm -f "${HOME}/.zshrc.bak"
rm -f "${HOME}/.zshrc"

# Remove zsh plugins
rm -fr "${ZSH_CUSTOM}"

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

# Uninstall Brew formulas and casks
$BREW uninstall --force --zap $($BREW list)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# Restore bash as login shell
/usr/bin/chsh -s /bin/bash

exit 0