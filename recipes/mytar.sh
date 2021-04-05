#!/usr/bin/env bash

# Description: tar utility wrapper
# Author: Maros Kukan

# touch {a..d}.zip; echo "Step 1: Temporary files created"; \
# mkdir zips; echo "Step 2: Temporary directory created"; \
# mv *zip zips; echo "Step 3: Files moved to directory"; \
# ./mytar.sh zips zips.gzip; echo "Step 4: Directory Compressed"; \
# file zips.gzip; echo "Step 5: Archive verified"; \
# rm -rf zips "Step 6: Directory removed"; \
# ./mytar.sh zips.gzip; echo "Step 7: Archive Extracked"; \
# ls zips; echo "Step 8: Folder listed"; \
# rm -rf zips zips.gzip; echo "Step 9: All files removed"

if [[ ! $1 ]]; then
    echo "Compress Usage: $0 <dir> <file>" >&2
    echo "Decompress Usage: $0 <mytar> <filename>"
    exit 1
fi

if [[ ! -e $1 ]]; then
    echo "File or directory $1 not found." >&2
    exit 2
fi

if [[ -d $1 ]]; then
    operation="c"
    if [[ ! $2 ]]; then
        echo "Need name of file or directory to create as second argument" >&2
        exit 1
    fi
    tarfile="$2"
    dir="$1"
else
    # is a file: try to extract
    operation="x"
    tarfile="$1"
    dir=""
fi

# Evaluating file extension and setting up options
case $tarfile in
    *.tgz|*.gz|*.gzip)
        zip="z"
        echo "Using gzip" >&2;;
    *.bz|*.bz2|*.bzip|*.bzip2)
        zip="j"
        echo "Using bzip2" >&2;;
    *.Z)
        zip="Z"
        echo "Using compress" >&2;;
    *.tar)
        zip=""
        echo "No compression used" >&2;;
    *)
        echo "Unknown extension: ${tarfile}" >&2
        exit 3;;
esac

command="tar ${operation}${zip}f $tarfile"
if [[ $dir ]]; then
    command="${command} $dir"
fi

if ! $command; then
    echo "Error: tar exited with status $?" >&2
    exit 4
fi

echo "Ok" >&2;
exit 0

    