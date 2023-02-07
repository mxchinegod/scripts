#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# It's adding iTerm to the dock.
__dock_item() {
    # Get the list of apps in the Dock
    DOCK_APPS=$(defaults read com.apple.dock persistent-apps)
    # Check if the app is already in the Dock
    if ! echo $DOCK_APPS | grep "$1" >/dev/null; then
        # Add the app to the Dock
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$2</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    else
        purple "⛔️ $1 already in the Dock"
    fi
}

# It's checking if you have Homebrew installed. If you don't, it's going to install it.
start () {
    command -v brew >/dev/null 2>&1 || { purple "⛔️ You don't yet have Homebrew, installing now"; \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
        purple "✅ Adding brew to your PATH"; \
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.zprofile; \
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile; \
        eval "$(/opt/homebrew/bin/brew shellenv)"; }
        if [[ $(cat $HOME/.zshrc | grep "source <(kubectl completion zsh)") ]]; then
            purple "⛔️ kubectl completion already configured"
        else
            echo 'source <(kubectl completion zsh)' >> $HOME/.zshrc
        fi
    zsh
}


# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
zsh () {
    if [ "$SHELL" = "/bin/zsh" ]
        then
            purple "✅ You're using ZSH, going to install Oh-My-Zsh (https://ohmyz.sh)"
            omz
        else
            purple "⛔️ You're not using ZSH, going to fix that for you."
            brew install zsh
            if [[ $(cat $HOME/.zshrc | grep "PROMPT_EOL_MARK=''") ]]; then
               continue
            else
                echo PROMPT_EOL_MARK='' > ~/.zshrc
            fi
            zsh
    fi
}

# It's checking if you're using ZSH. If you are, it's going to install Oh-My-Zsh. If you're not, it's
# going to install ZSH and then Oh-My-Zsh.
omz () {
    if [[ -d "$HOME/.oh-my-zsh" ]]
        then
            purple "⛔️ You already have Oh-My-Zsh."
        else
            purple "💿 Installing Oh-My-Zsh"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            purple "📡 Going to try to update Oh-My-Zsh for the first time"
            omz update
    fi
    iterm
}

# It's checking if iTerm2 is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
iterm () {
    if [[ $(brew list --cask | grep "iterm2") ]]; then
        purple "⛔️ iTerm2 is already installed"
    else
        purple "💿 Installing iTerm2"
        brew install iterm2
    fi
    theme
}

# It's installing the theme for iTerm2.
theme () {
    if which starship >/dev/null; then
        purple "⛔️ starship theme is already installed"
    else
        purple "💿 Installing theme..."
        brew install starship
    fi
    if [[ $(cat $HOME/.zshrc | grep "eval '$(starship init zsh)'") ]]; then
        purple "⛔️ starship theme is already set"
    else
        echo "eval '$(starship init zsh)'" >> ~/.zshrc
        purple "🎨 Theme installed 🎨"
    fi
    if [[ $(brew list --cask | grep "font-hack-nerd-font") ]]; then
        purple "⛔️ Hack Nerd font is already installed"
    else
        purple "📚 Installing font & iTerm colors"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        curl -k https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors --output 'Snazzy.itermcolors'
        open Snazzy.itermcolors
        sleep 0.5
        rm Snazzy.itermcolors
    fi
    git
}

# It's checking if git is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
git () {
    if which git >/dev/null; then
        purple "⛔️ git is already installed"
    else
        purple "💿 Installing git..."
        brew install git
    fi
    raycast
}

# It's checking if Raycast is installed. If it is, it's going to print out that it's installed. If
# it's not, it's going to install it.
raycast () {
    if [[ $(ls /Applications | grep "Raycast.app") ]]; then
        purple "⛔️ Raycast is already installed"
    else
        purple "🌞 Installing RayCast"
        brew install --cask raycast
    fi
    neofetch
}

# It's checking if Neofetch is installed. If it is, it's going to print out that it's installed. If
# it's
# not, it's going to install it.
neofetch () {
    if which neofetch >/dev/null; then
        purple "⛔️ Neofetch is already installed"
    else
        purple "🖥️ Installing Neofetch"
        brew install neofetch
    fi
    vscode
}

# It's checking if VSCode is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
vscode () {
    if [[ $(ls /Applications | grep "Visual Studio Code.app") ]]; then
        purple "⛔️ VSCode is already installed"
    else
        purple "🧑‍💻 Installing VSCode"
        brew install --cask visual-studio-code
    fi
    docker
}

# It's checking if Docker is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
docker () {
    if which docker >/dev/null; then
        purple "⛔️ Docker is already installed"
    else
        purple "💿 Installing Docker"
        brew cask install docker
    fi
    kubectl
}

# It's checking if kubectl is installed. If it is, it's going to print out that it's installed. If
# it's not, it's going to install it.
kubectl () {
    if which kubectl >/dev/null; then
        purple "⛔️ kubectl is already installed"
    else
        purple "💿 Installing kubectl"
        brew install kubectl
    fi
    lens
}

# It's checking if Lens is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
lens () {
    if [[ $(ls /Applications | grep "Lens.app") ]]; then
        purple "⛔️ Lens is already installed"
    else
        purple "💿 Installing Lens"
        brew install --cask lens
    fi
    notion
}

# It's checking if Notion is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to ask you if you want to install it. If you say yes, it's going to install it. If
# you say no, it's going to cancel the installation.
notion () {
    if open -a "Notion.app" --hide; then
        purple "⛔️ Notion is already installed"
    else
        purple "🙋 Would you like to install excellent note-taking app, Notion❓ (y/n)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            purple "💿 Installing Notion"
            brew cask install notion
        else
            purple "⛔️ Notion installation cancelled"
        fi
    fi
    helm
}

# It's checking if Helm is installed. If it is, it's going to print out that it's installed. If it's
# not, it's going to install it.
helm () {
    if which helm >/dev/null; then
        purple "⛔️ Helm is already installed"
    else
        purple "💿 Installing Helm!"
        brew install helm
        purple "✅ Helm installed!"
    fi
    precommit
}

# It's checking if pre-commit is installed. If it is, it's going to print out that it's installed. If
# it's not, it's going to install it.
precommit () {
    if which pre-commit >/dev/null; then
        purple "⛔️ pre-commit is already installed"
    else
        purple "💿 Installing pre-commit!"
        brew install pre-commit
        purple "✅ pre-commit installed!"
    fi
    kompose
}

# It's checking if kompose is installed. If it is, it's going to print out that it's installed. If
# it's not, it's going to install it.
kompose () {
    if which kompose >/dev/null; then
        purple "⛔️ kompose is already installed"
    else
        purple "🙋 Would you like to install docker->k8s conversion tool, kompose❓ (y/n)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            purple "💿 Installing kompose"
            brew install kompose
            purple "✅ kompose installed!"
        else
            purple "⛔️ kompose installation cancelled"
        fi
    fi
    finish
}

path () {
    purple "😌 What zsh alias would you like to assign to your scripts folder? (a name/shortcut): "
    read -r variable
    if [ ${#variable} -le 1 ]; then
        purple "⛔️ Too short!"
        path
    else
        CURRENT="$variable=$PWD/"
        if [[ !$(cat $HOME/.zshrc | grep "export $CURRENT") ]]; then
            purple "⛔️ Already added to your zsh aliases!?"
        else
            echo "" >> $HOME/.zshrc
            echo "# Custom scripts path | https://github.com/DylanAlloy/scripts" >> $HOME/.zshrc
            echo "export $CURRENT" >> $HOME/.zshrc
            purple "✅ Added to $HOME/.zshrc with 'export $CURRENT'"
        fi
    fi
}

# It's adding iTerm to the dock.
finish () {
    __dock_item "iTerm" "iTerm.app"
    __dock_item "Visual Studio Code" "Visual Studio Code.app"
    __dock_item "Docker" "Docker.app"
    __dock_item "Lens" "Lens.app"
    __dock_item "Notion" "Notion.app"
    path
    purple "🧑‍💻 Restarting Dock"
    killall Dock
    purple "✨ SUCCESS! ➡️ Import iterm.json into iTerm to finish."
    purple "📄 OPTIONAL STEP ➡️ change VSCode terminal font to 'Hack Nerd Font Mono'"
}

start
