#!/bin/bash

set -e
set -u

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IGNORED_FILES=(.git .gitignore link-files.sh README.md)



# Adapted from http://stackoverflow.com/a/8574392/38140
in_array() { for e in "${@:2}"; do [[ "$e" = "$1" ]] && break; done; }

for file in `ls -A $ROOT`; do
    file_path="$ROOT/$file"
    if ( in_array "$file" "${IGNORED_FILES[@]}" ); then
        echo "Ignoring $file"
    else
        link_location="$HOME/$file"
        echo "Creating symlink $link_location"
    fi
done