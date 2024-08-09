#!/bin/bash

test_dirs=()

while IFS= read -r file; do
    test_dirs+=("$file")
done < directories.txt

for dir in "${test_dirs[@]}"; do
  sh "$dir"/do_test.sh $1
done