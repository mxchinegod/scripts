#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple() {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# It's checking if the first argument is -h. If it is, it prints out the help message and exits.
if [ "$1" == "-h" ]; then
    purple "🛟 whatarmy.sh (-h) [clone path] [repos.txt location]"
    purple "💬 clones infinite git repositories"
    exit 0
fi

# It's a ternary operator. It's a shorthand way of writing an if/else statement.
[[ $2 ]] && repos_file="$2" || repos_file="$(pwd)/git/repos.txt"

# Read the file and clone each repository
while read repo; do
    git clone "$repo" $1/$(basename $repo) 2>/dev/null
    if [ $? -ne 0 ]; then
        purple "🚨 Failed to clone into $1/$(basename $repo)"
    else
        purple "✅ Successfully cloned into $1/$(basename $repo)"
    fi
done <"$repos_file"
