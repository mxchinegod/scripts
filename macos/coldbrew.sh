#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# It's adding iTerm to the dock.
__dock_item() {
    printf '%s%s%s%s%s' \
           '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
           '<key>_CFURLString</key><string>' \
           "$1" \
           '</string><key>_CFURLStringType</key><integer>0</integer>' \
           '</dict></dict></dict>'
}

# It's checking if you have Homebrew installed. If you don't, it's going to install it.
start () {
    command -v brew >/dev/null 2>&1 || { purple "⛔️ You don't yet have Homebrew, installing now ⛔️"; \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
        purple "✅ Adding brew to your PATH ✅"; \
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/$USER/.zprofile; \
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile; \
        eval "$(/opt/homebrew/bin/brew shellenv)"; }
    zsh
}

# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
zsh () {
    if [ "$SHELL" = "/bin/zsh" ]
        then
            purple "✅ You're using ZSH, going to install Oh-My-Zsh (https://ohmyz.sh) ✅"
            omz
        else
            purple "⛔️ You're not using ZSH, going to fix that for you. ⛔️"
            brew install zsh
            zsh
    fi
}

# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
omz () {
    if [[ -d "/Users/$USER/.oh-my-zsh" ]]
        then 
            purple "⛔️ You already have Oh-My-Zsh. ⛔️"
        else
            purple "📀 Installing Oh-My-Zsh 📀" 
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            purple "📡 Going to try to update Oh-My-Zsh for the first time 📡"
            omz update
    fi
    iterm
}

# It's checking if iTerm2 is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
iterm () {
    if [[ $(brew list --cask | grep "iterm2") ]]; then
        purple "⛔️ iTerm2 is installed already ⛔️"
    else
        purple "📀 Installing iTerm2 📀"
        brew install iterm2
    fi
    theme
}

# It's installing the theme for iTerm2.
theme () {
    if which starship >/dev/null; then
        purple "⛔️ starship theme is installed already ⛔️"
    else
        purple "📀 Installing theme... 📀"
        brew install starship
        echo "eval '$(starship init zsh)'" >> ~/.zshrc
        purple "🎨 Theme installed 🎨"
    fi
    if [[ $(brew list --cask | grep "font-hack-nerd-font") ]]; then
        purple "⛔️ Hack Nerd font is installed already ⛔️"
    else
        purple "📚 Installing font & iTerm colors 📚"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        curl -k https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors --output 'Snazzy.itermcolors'
        open Snazzy.itermcolors
        sleep 0.5
        rm Snazzy.itermcolors
    fi
    raycast
}

# It's checking if Raycast is installed. If it is, it's going to print out that it's installed. If
# it's not, it's going to install it.
raycast () {
    if [[ $(ls /Applications | grep "Raycast.app") ]]; then
        purple "⛔️ Raycast is installed already ⛔️"
    else
        purple "🌞 Installing RayCast 🌞"
        brew install --cask raycast
    fi
    neofetch
}

# It's checking if Neofetch is installed. If it is, it's going to print out that it's installed. If
# it's
# not, it's going to install it.
neofetch () {
    if which neofetch >/dev/null; then
        purple "⛔️ Neofetch is installed already ⛔️"
    else
        purple "🖥️ Installing Neofetch 🖥️"
        brew install neofetch
    fi
    vscode
}

# It's checking if VSCode is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
vscode () {
    if [[ $(ls /Applications | grep "Visual Studio Code.app") ]]; then
        purple "⛔️ VSCode is installed already ⛔️"
    else
        purple "🧑‍💻 Installing VSCode 🧑‍💻"
        brew install --cask visual-studio-code
    fi
    docker
}

docker () {
    if which docker >/dev/null; then
        purple '⛔️ Docker is already installed ⛔️'
    else
        purple '📀 Installing Docker 📀'
        brew cask install docker
    fi
    kubectl
}

kubectl () {
    if which kubectl >/dev/null; then
        purple '⛔️ kubectl is already installed ⛔️'
    else
        purple '📀 Installing kubectl 📀'
        brew install kubectl
    fi
    lens
}

lens () {
    if [[ $(ls /Applications | grep "Lens.app") ]]; then
        purple '⛔️ Lens is already installed ⛔️'
    else
        purple '📀 Installing Lens 📀'
        brew install --cask lens
    fi
    notion
}

notion () {
    if open -a "Notion.app" --hide; then
        purple "⛔️ Notion is already installed ⛔️"
    else
        purple "🙋 Would you like to install excellent note-taking app, Notion❓ (y/n)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            purple "📀 Installing Notion 📀"
            brew cask install notion
        else
            purple "⛔️ Notion installation cancelled ⛔️"
        fi
    fi
    finish
}

# It's adding iTerm to the dock.
finish () {
    defaults write com.apple.dock \
        persistent-apps -array-add "$(__dock_item /Applications/iTerm.app)"
    defaults write com.apple.dock \
        persistent-apps -array-add "$(__dock_item /Applications/Visual\ Studio\ Code.app)"
    defaults write com.apple.dock \
        persistent-apps -array-add "$(__dock_item /Applications/Docker.app)"
    defaults write com.apple.dock \
        persistent-apps -array-add "$(__dock_item /Applications/Lens.app)"
    defaults write com.apple.dock \
        persistent-apps -array-add "$(__dock_item /Applications/Notion.app)"
    purple "🧑‍💻 Restarting Dock 🧑‍💻"
    killall Dock
    purple "✨ SUCCESS! ✨ Import iterm.json into iTerm to finish."
    purple "📄 OPTIONAL STEP 📄 change VSCode terminal font to 'Hack Nerd Font Mono'"
}

start