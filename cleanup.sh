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

# Remove worskapce dir
# rm -fr "${HOME}/workspace"

# Remove zshrc
rm -f "${HOME}/.zshrc"

# Remove zsh custom folder
rm -fr "$ZSH_CUSTOM"

# Remove p10k
rm -f "${HOME}/.p10k.zsh"

# Remove k9s catpuccin theme
rm -fr "${K9S_CONFIG_PATH}/skins"
rm -f "${K9S_CONFIG_PATH}/skin.yml"

# Remove neovim config
rm -fr "${HOME}/.config/nvim"

# Remove karabiner config
rm -fr "${HOME}/.config/karabiner/karabiner.json"

# Clean up iTerm
rm -fr "$ITERM_CONFIG_DIR"

# Clean up zellij
rm -fr "${HOME}/.config/zellij"

# Uninstall Brew formulas and casks
# shellcheck disable=SC2046
"$BREW" uninstall --force --zap $($BREW list)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# Restore bash as login shell
/usr/bin/chsh -s /bin/bash

exit 0
