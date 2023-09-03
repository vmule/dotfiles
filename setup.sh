#!/bin/bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ $(uname -m) == 'arm64' ]]; then
	BREW="/opt/homebrew/bin/brew"
else
	BREW="/usr/local/bin/brew"
fi

BREW_PREFIX=$("$BREW" --prefix)
DOTFILES="${HOME}/workspace/dotfiles"
ITERM_CONFIG_DIR="${HOME}/.iterm2"
K9S_CONFIG_PATH="${HOME}/Library/Application Support/k9s"
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

# Brew
"$BREW" update

# Install what I need
"$BREW" bundle --file ./brewfile

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
ln -s "${DOTFILES}/zsh/zshrc" "${HOME}/.zshrc"

if [ "${ZSH_CUSTOM+x}" = "" ]; then
	ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
else
	echo "ZSH_CUSTOM is set to '$ZSH_CUSTOM'"
fi

touch "${ZSH_CUSTOM}/secrect_alias.zsh"
mkdir "${HOME}/workspace"

# Install zsh plugins
curl https://raw.githubusercontent.com/kaplanelad/shellfirm/main/shell-plugins/shellfirm.plugin.oh-my-zsh.zsh \
	--create-dirs -o "${ZSH_CUSTOM}/plugins/shellfirm/shellfirm.plugin.zsh"

git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM}/plugins/autoupdate" --depth 1
git clone https://github.com/clarketm/zsh-completions "${ZSH_CUSTOM}/plugins/zsh-completions" --depth 1

# Install and configure p10k
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k" --depth 1
mv "${HOME}/.p10k.zsh" "${HOME}/.p10k.zsh.bak"
ln -s "${DOTFILES}/p10k/p10k.zsh" "${HOME}/.p10k.zsh"

# Install k9s catpuccin theme
git clone https://github.com/catppuccin/k9s.git "${K9S_CONFIG_PATH}/skins/catpuccin" --depth 1
cp "${K9S_CONFIG_PATH}/skins/catpuccin/dist/mocha.yml" "${K9S_CONFIG_PATH}/skin.yml"

# Configure neovim
git clone https://github.com/NvChad/NvChad.git "${HOME}/.config/nvim" --depth 1
ln -s "${DOTFILES}/nvim" "${HOME}/.config/nvim/lua/custom"

# Configure iTerm
mkdir "$ITERM_CONFIG_DIR"
cp "${DOTFILES}/iterm/com.googlecode.iterm2.plist" "$ITERM_CONFIG_DIR"
# # Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$ITERM_CONFIG_DIR"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Configure Karabiner
cp "${HOME}/.config/karabiner/karabiner.json" "${DOTFILES}/karabiner/karabiner.json"

# Configure zellij
mkdir -p "${HOME}/.config/zellij"
ln -s "${DOTFILES}/zellij/config.kdl" "${HOME}/.config/zellij/config.kdl"

# Add useful stuff to alias.zsh
cat <<EOT >>"${ZSH_CUSTOM}/alias.zsh"

export PATH=/usr/local/opt/python/libexec/bin:${HOME}/bin:/usr/local/bin:${BREW_PREFIX}/bin:${PATH}

# Source secret aliases
source ${ZSH_CUSTOM}/secrect_alias.zsh

# Configure zsh-syntax-highlighting.zsh
source ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Configure zsh-autosuggestions
source ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Configure zsh-history-substring-search
source ${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

alias python='${BREW_PREFIX}/bin/python3'
alias vi='${BREW_PREFIX}/bin/nvim'
alias vimdiff='${BREW_PREFIX}/bin/nvim -d'
alias k='${BREW_PREFIX}/bin/kubectl'
alias ls='${BREW_PREFIX}/bin/exa --git --icons --sort type'
alias ws='cd ${HOME}/workspace'
alias c='clear'
EOT

# Change shell to zsh
/usr/bin/chsh -s /bin/zsh

exit 0
