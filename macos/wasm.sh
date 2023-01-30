#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

emscripten () {
    if [[ $(ls | grep emsdk) ]]; then
        purple "⛔️ emsdk looks to have been cloned already, replace❓ [y/n]:"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
            purple "⏬ Cloning emscripten"
            git clone https://github.com/emscripten-core/emsdk.git >/dev/null
            cd emsdk
            purple "✅ cloned esmdk into ${PWD}"
            git pull >/dev/null
            ./emsdk install latest >/dev/null
            ./emsdk activate latest >/dev/null
            source ./emsdk_env.sh
        else
            purple "⛔️ Did not overwrite current emsdk directory"
        fi
        if which cmake >/dev/null; then
            purple "⛔️ cmake is already installed"
        else
            purple "💿 Installing cmake"
            brew install cmake >/dev/null
            purple "✅ cmake installed"
        fi
    fi
}

if [ "$1" == "-h" ]; then
    purple "🛟 wasm.sh"
    purple "💬 installs Emscripten (https://emscripten.org/docs/getting_started/downloads.html)"
    purple "💬 for C++ → wasm compilation & makes sure cmake is available"
    exit 0
else
    emscripten
fi
