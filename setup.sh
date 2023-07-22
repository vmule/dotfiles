#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW=$(which brew)
BREW_PREFIX=$($BREW --prefix)
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

# Brew
$BREW tap homebrew/caskfonts git@github.com:Homebrew/homebrew-cask-fonts.git
$BREW update


# Install formulas I need
$BREW install -f \
  font-hack-nerd-font \
  git \
  git-flow \
  gpg \
  jq \
  k9s \
  kube-linter \
  lazygit \
  lima \
  minikube \
  neovim \
  npm \
  pinentry-mac \
  python3 \
  rg \
  wget \
  zsh-syntax-highlighting \

# Install casks I need
$BREW install --cask \
  docker \
  google-chrome \
  iterm2 \


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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
ln -s "${HOME}/workspace/dotfiles/zsh/p10k.zsh" "${HOME}/.p10k.zsh"

# Configure neovim
git clone https://github.com/NvChad/NvChad.git "${HOME}/.config/nvim" --depth 1
ln -s "${HOME}/workspace/dotfiles/nvim" "${HOME}/.config/nvim/lua/custom"

# Configure iTerm
# # Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/workspace/dotfiles/iterm"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
#
# Add useful stuff to .zshrc
cat <<EOT >> "${ZSH_CUSTOM}/alias.zsh"

export PATH=/usr/local/opt/python/libexec/bin:${HOME}/bin:/usr/local/bin:${BREW_PREFIX}/bin:${PATH}

alias python="${BREW_PREFIX}/bin/python3"
alias vi="${BREW_PREFIX}/bin/nvim"
alias vimdiff="${BREW_PREFIX}/bin/nvim -d"
alias k="${BREW_PREFIX}/bin/kubectl"
EOT

exit 0
