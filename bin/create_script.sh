#!/usr/bin/env bash

# This script creates a new bash script and sets executive permission
# Author: Maros Kukan

# Test if argument exists, if not exit
if [[ ! $1 ]]; then
    echo "Missing argument" >&2
    exit 1
fi

declare scriptname
declare -r bindir="${HOME}/bin"
declare filename
declare open_editor=""

# Test for single argument provided
if [[ $# -eq 1 ]]; then
    open_editor="true"
fi

# Test if bin directory exists
if [[ ! -d "$bindir" ]]; then
    # if not: create it
    if mkdir "$bindir"; then
        echo "Created ${bindir}" >&2
    else
        echo "Could not create ${bindir}." >&2
        exit 1
    fi
fi

while [[ $1 ]]; do
    scriptname="$1"
    filename="${bindir}/${scriptname}"

    # Test if file already exists
    if [[ -e "$filename" ]]; then
        echo "File ${filename} already exists" >&2
        shift
        continue
    fi

    if type "$scriptname" > /dev/null 2>&1; then
        echo "There is already a command with name ${scriptname}" >&2
        shift
        continue
    fi

    # Create a script with a single line
    echo '#!/usr/bin/env bash' > "$filename"
    echo "Created $filename"
    # Add executable permission
    chmod u+x "$filename"

    shift
done

# Open in default editor
if [[ $open_editor ]]; then
    echo "Opening"
    if [[ $EDITOR ]]; then
        $EDITOR "$filename"
    else
        echo "Script created, not starting editor becasue \$EDITOR is not set."
    fi
fi
exit 0