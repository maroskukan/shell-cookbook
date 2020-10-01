#!/usr/bin/env bash

# This script creates a new bash script and sets executive permission
# Author: Maros Kukan

# Test if argument exists, if not exit
if [[ ! $1 ]]; then
    echo "Missing argument"
    exit 1
fi

declare scriptname="$1"
declare bindir="${HOME}/bin"
declare filename="${bindir}/${scriptname}"


# Test if file already exists
if [[ -e "$filename" ]]; then
    echo "File ${filename} already exists"
    exit 1
fi

if type "$scriptname" > /dev/null 2> /dev/null; then
    echo "There is already a command with name ${scriptname}"
    exit 1
fi

# Test if bin directory exists
if [[ ! -d "$bindir" ]]; then
    # if not: create it
    if mkdir "$bindir"; then
        echo "Created ${bindir}"
    else
        echo "Could not create ${bindir}."
        exit 1
    fi
fi

# Create a script with a single line
echo '#!/usr/bin/env bash' > "$filename"
# Add executable permission
chmod u+x "$filename"

# Open in default editor
if [[ $EDITOR ]]; then
    $EDITOR "$filename"
else
    echo "Script created, not starting editor becasue \$EDITOR is not set."
fi

