#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW=$(which brew)
BREW_PREFIX=$($BREW --prefix)
ITERM_CONFIG_DIR="${HOME}/.iterm2"
K9S_CONFIG_PATH="${HOME}/Library/Application Support/k9s"
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

# Brew
$BREW update

# Install what I need
$BREW bundle --file homebrew/brewfile

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
ln -s "${HOME}/workspace/dotfiles/zsh/zshrc" "${HOME}/.zshrc"

if [ -z ${ZSH_CUSTOM+x} ]
then
  ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
else
  echo "ZSH_CUSTOM is set to '$ZSH_CUSTOM'"
fi

# Install zsh plugins
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM}/plugins/autoupdate" --depth 1

# Install and configure p10k
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k" --depth 1
mv "${HOME}/.p10k.zsh" "${HOME}/.p10k.zsh.bak"
ln -s "${HOME}/workspace/dotfiles/p10k/p10k.zsh" "${HOME}/.p10k.zsh"

# Install k9s catpuccin theme
git clone https://github.com/catppuccin/k9s.git "${K9S_CONFIG_PATH}/skins/catpuccin" --depth 1
cp "${K9S_CONFIG_PATH}/skins/catpuccin/dist/mocha.yml" "${K9S_CONFIG_PATH}/skin.yml"

# Configure neovim
git clone https://github.com/NvChad/NvChad.git "${HOME}/.config/nvim" --depth 1
ln -s "${HOME}/workspace/dotfiles/nvim" "${HOME}/.config/nvim/lua/custom"

# Configure iTerm
mkdir "${ITERM_CONFIG_DIR}"
cp "${HOME}/workspace/dotfiles/iterm/com.googlecode.iterm2.plist" "${ITERM_CONFIG_DIR}"
# # Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${ITERM_CONFIG_DIR}"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
#
# Add useful stuff to alias.zshr
cat <<EOT >> "${ZSH_CUSTOM}/alias.zsh"

export PATH=/usr/local/opt/python/libexec/bin:${HOME}/bin:/usr/local/bin:${BREW_PREFIX}/bin:${PATH}

# Configure zsh-syntax-highlighting.zsh
source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="${BREW_PREFIX}/share/zsh-syntax-highlighting/highlighters"

alias python="${BREW_PREFIX}/bin/python3"
alias vi="${BREW_PREFIX}/bin/nvim"
alias vimdiff="${BREW_PREFIX}/bin/nvim -d"
alias k="${BREW_PREFIX}/bin/kubectl"
EOT

exit 0
