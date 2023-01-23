#!/bin/bash

PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# It's checking if the first argument is -h. If it is, it prints out the help message and exits.
if [ "$1" == "-h" ]; then
  purple "🛟 pdf.sh (-h) ['fed' or a URL] : scrapes all PDF links from a webpage"
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

table_ascii () {

    # Get the input HTML file
    html_file=$1

    # Extract the table rows
    rows=$(grep -o "<tr.*</tr>" $html_file)

    # Process each row
    for row in $rows; do
        # Extract the columns
        columns=$(grep -o "<td.*</td>" <<< $row)
        # Process each column
        for column in $columns; do
            # Extract the text
            text=$(grep -o ">.*<" <<< $column | sed 's/<[^>]*>//g')
            # Output the text padded with spaces
            printf "%-15s" "$text"
        done
        echo ""
    done
}

get_table $1