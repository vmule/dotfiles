#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW=$(which brew)
BREW_PREFIX=$($BREW --prefix)

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
  neofetch \
  neovim \
  npm \
  pinentry-mac \
  python3 \
  rg \
  wget \


# Install casks I need
$BREW install --cask \
  docker \
  google-chrome \
  iterm2 \


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/romkatv/powerlevel10k.git "${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k" --depth 1
ln -s "${HOME}/workspace/dotfiles/iterm/p10k.zsh" "${HOME}/.p10k.zsh"

# Add useful stuff to .zshrc
cat <<EOT >> ~/.zshrc 

export PATH=/usr/local/opt/python/libexec/bin:${HOME}/bin:/usr/local/bin:${BREW_PREFIX}/bin:${PATH}

alias python="${BREW_PREFIX}/bin/python3"
alias vi="${BREW_PREFIX}/bin/nvim"
alias vimdiff="${BREW_PREFIX}/bin/nvim -d"
alias k="${BREW_PREFIX}/bin/kubectl"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOT

git clone https://github.com/NvChad/NvChad.git "${HOME}/.config/nvim" --depth 1
ln -s "${HOME}/workspace/dotfiles/nvim" "${HOME}/.config/nvim/lua/custom"
# source "${HOME}/.zshrc"

exit 0
