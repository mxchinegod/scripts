#!/bin/sh
GREEN="\e[32m"
ENDCOLOR="\e[0m"

green () {
    echo -e $(printf "${GREEN}$1${ENDCOLOR}")
}

start () {
    command -v brew >/dev/null 2>&1 || { echo >&2 "You don't yet have Homebrew, installing now."; \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }
    zsh
}

omz () {
    if [[ -d "/Users/$USER/.oh-my-zsh" ]]
        then 
            green "You already have Oh-My-Zsh."
        else
            green "Installing Oh-My-Zsh" 
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            green "Going to try to update Oh-My-Zsh for the first time."
            omz update
    fi
    iterm
}

zsh () {
    if [ "$SHELL" = "/bin/zsh" ]
        then
            green "You're using ZSH, going to install Oh-My-Zsh (https://ohmyz.sh)"
            omz
        else
            green "You're not using ZSH, going to fix that for you."
            brew install zsh
            zsh
    fi
}

iterm () {
    green "Installing iTerm2..."
    brew install iterm2
    theme
}

theme () {
    green "Installing theme..."
    brew install starship
    echo "eval '$(starship init zsh)'" >> ~/.zshrc
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    curl https://github.com/sindresorhus/iterm2-snazzy/raw/main/Snazzy.itermcolors --output Snazzy.itermcolors 
    open Snazzy.itermcolors
    green "Theme installed."
    rm Snazzy.itermcolors
}

start