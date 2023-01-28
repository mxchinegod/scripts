#!/bin/bash

PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# It's checking if the first argument is -h. If it is, it prints out the help message and exits.
if [ "$1" == "-h" ]; then
  purple "🛟 pdf.sh (-h) ['fed' or a URL]"
  purple "💬 loads all PDF links from a URL or Federal Reserve Website"
  exit 0
fi

get_table () {
    case $1 in
        'fed' | 'reserve' | 'Reserve')
            URL="https://www.federalreserve.gov/monetarypolicy/fomccalendars.htm";;
        *)
            URL=$1
    esac
    # Fetch the calendar page
    curl -s $URL > calendar.html
    # Extract the href properties
    base_domain=$(echo $URL | sed -E 's|^.*://||; s|/.*$||')
    purple "📝 All PDF documents from https://$base_domain"
    hrefs=$(grep -o 'href=".*"' calendar.html | awk -F "\"" '{print $2}' | grep 'pdf' | sed 's/^/https:\/\/'$base_domain'/')
    # Output the href properties
    echo "$hrefs"
    rm calendar.html
}

get_table $1
