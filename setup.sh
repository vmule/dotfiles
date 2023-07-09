#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH:
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brew
BREW=`which brew`
$BREW update

# Install formulas I need
$BREW install \
        git \
        k9s \
	minikube \
        neovim \
        python3 \

# Install cask I need
$BREW install --cask \
	docker \
        google-chrome \ 
	iterm2 \ 


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add useful stuff to .zshrc
cat <<EOT >> ~/.zshrc 
export PATH=/usr/local/opt/python/libexec/bin:$HOME/bin:/usr/local/bin:$PATH
alias python=/opt/homebrew/bin/python3
alias vi=/opt/homebrew/bin/nvim
alias k=`which kubectl`
EOT

source ~/.zshrc
         
