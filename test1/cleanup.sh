#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
echo "Cleanup $SCRIPT_DIR"
cd "$SCRIPT_DIR"

FILES=("et_integers.txt" "et_floats.txt" "et_strings.txt" "in1.txt" "in2.txt")

for file in *.txt; do
    if [[ ! " ${FILES[@]} " =~ " ${file} " ]]; then
        rm "$file"
    fi
done
