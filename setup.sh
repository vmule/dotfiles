#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW=$(which brew)
BREW_PREFIX=$($BREW --prefix)

# Add Homebrew to your PATH:
(echo; echo 'eval "$($BREW shellenv)"') >> "/Users/${USER}/.zprofile"
eval "$($BREW shellenv)"

# Brew
$BREW tap homebrew/caskfonts git@github.com:Homebrew/homebrew-cask-fonts.git
$BREW update

# Install formulas I need
$BREW install -f \
  font-hack-nerd-font \
  git \
  gpg \
  jq \
  k9s \
  kube-linter \
  lima \
  minikube \
  neovim \
  npm \
  pinentry-mac \
  python3 \
  wget \


# Install casks I need
$BREW install --cask \
  docker \
  google-chrome \
  iterm2 \


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Add useful stuff to .zshrc
cat <<EOT >> ~/.zshrc 

export PATH=/usr/local/opt/python/libexec/bin:$HOME/bin:/usr/local/bin:$BREW_PREFIX/bin:$PATH

alias python="$BREW_PREFIX/bin/python3"
alias vi="$BREW_PREFIX/bin/nvim"
alias vimdiff="$BREW_PREFIX/bin/nvim -d"
alias k=$(which kubectl)
EOT

git clone https://github.com/NvChad/NvChad.git "${HOME}/.config/nvim" --depth 1
mkdir "${HOME}/.config/nvim/lua/custom"
cp -fr nvim_config/* "${HOME}/.config/nvim/lua/custom/"

source "${HOME}/.zshrc"
