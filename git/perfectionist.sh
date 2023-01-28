#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple() {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

if [ "$1" == "-h" ]; then
    purple "🛟 perfectionist.sh"
    purple "💬 loads a pre-commit config from URL from first line of script's local perfectionist.txt"
    purple "💬 then uses remaining URLs in the file to populate .git/hooks folder"
    exit 0
else
    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    # Check if the working directory is a git project
    if ! [ -d .git ]; then
        purple "⛔️ Not a git project directory"
        exit 1
    fi

    # Read URLs from perfectionist.txt
    urls=($(cat ${SCRIPT_DIR}/perfectionist.txt))

    # Check if all lines in perfectionist.txt are URLs
    for url in "${urls[@]}"; do
        if ! [[ "$url" =~ ^https?:// ]]; then
            purple "⛔️ perfectionist.txt contains a non-URL line"
            exit 1
        fi
    done

    # Download the first URL
    first_url=${urls[0]}
    curl "$first_url" --output ".pre-commit-config.yaml" &> /dev/null
    pre=$(basename "$first_url")
    purple "✅ downloaded $pre to the root of the project, just use pre-commit at CLI"

    # Download all other URLs into .git/hooks
    for url in "${urls[@]:1}"; do
        filename=$(basename "$url")
        curl "$url" --output ".git/hooks/$filename" &> /dev/null
        chmod +x .git/hooks/$filename
        purple "✅ downloaded $filename to .git/hooks"
    done

fi
