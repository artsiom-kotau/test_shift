#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
echo "Cleanup $SCRIPT_DIR"
cd "$SCRIPT_DIR"

FILES=("et_integers.txt" "in1.txt")

for file in *.txt; do
    if [[ ! " ${FILES[@]} " =~ " ${file} " ]]; then
        rm "$file"
    fi
done

