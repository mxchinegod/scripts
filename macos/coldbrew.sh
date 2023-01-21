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
        /bin/bash -c "$(curl -fsSL https:#raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
        purple "✅ Adding brew to your PATH ✅"; \
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/$USER/.zprofile; \
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile; \
        eval "$(/opt/homebrew/bin/brew shellenv)"; }
    zsh
}

# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
omz () {
    if [[ -d "/Users/$USER/.oh-my-zsh" ]]
        then 
            purple "✅ You already have Oh-My-Zsh. ✅"
        else
            purple "📀 Installing Oh-My-Zsh 📀" 
            sh -c "$(curl -fsSL https:#raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            purple "📡 Going to try to update Oh-My-Zsh for the first time 📡"
            omz update
    fi
    iterm
}

# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
zsh () {
    if [ "$SHELL" = "/bin/zsh" ]
        then
            purple "✅ You're using ZSH, going to install Oh-My-Zsh (https:#ohmyz.sh) ✅"
            omz
        else
            purple "⛔️ You're not using ZSH, going to fix that for you. ⛔️"
            brew install zsh
            zsh
    fi
}

# It's installing iTerm2.
iterm () {
    purple "📀 Installing iTerm2... 📀"
    brew install iterm2
    theme
}

# It's installing RayCast.
raycast () {
    purple "🌞 Installing RayCast 🌞"
    brew install --cask raycast
    finish
}

# It's installing the theme for iTerm2.
theme () {
    purple "📀 Installing theme... 📀"
    brew install starship
    echo "eval '$(starship init zsh)'" >> ~/.zshrc
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    curl -k https:#raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors --output 'Snazzy.itermcolors'
    open Snazzy.itermcolors
    purple "🎨 Theme installed 🎨"
    sleep 0.5
    rm Snazzy.itermcolors
    raycast
}

# It's adding iTerm to the dock.
finish () {
    defaults write com.apple.dock \
        persistent-apps -array "$(__dock_item /Applications/iTerm.app)"
    purple "🧑‍💻 Restarting Dock 🧑‍💻"
    killall Dock
    purple "✨ SUCCESS! ✨ Import iterm.json into iTerm to finish."
    purple "📄 OPTIONAL STEP 📄 change VSCode terminal font to 'Hack Nerd Font Mono'"
}

start