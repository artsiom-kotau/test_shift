#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
echo "Cleanup $SCRIPT_DIR"
cd "$SCRIPT_DIR"

FILES=("et_integers.txt" "et_floats.txt" "et_strings.txt" "in1.txt" "test_floats.txt" "test_integers.txt" "test_strings.txt")

for file in *.txt; do
    if [[ ! " ${FILES[@]} " =~ " ${file} " ]]; then
        rm "$file"
    fi
done

sed -i '' '2,$d' test_floats.txt
sed -i '' '2,$d' test_integers.txt
sed -i '' '2,$d' test_strings.txt
