#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple() {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

if [ "$1" == "-h" ]; then
    purple "🛟 pythode.sh"
    purple "💬 checks a directory for python & node installation instructions, then installs them"
    exit 0
else
for d in */ ; do
  if [ -d "$d/.git" ]; then
    if [ -f "$d/requirements.txt" ]; then
      purple "✅ Found python project: $d"
      purple "💿 Installing dependencies with pip..."
      cd "$d"
      pip install -r requirements.txt
      cd ..
    elif [ -f "$d/package.json" ]; then
      purple "✅ Found node project: $d"
      purple "💿 Installing dependencies with npm..."
      cd "$d"
      npm i
      cd ..
    fi
    purple "⛔️ No python or node projects found"
  fi
  "⛔️ No git repositories found"
done
