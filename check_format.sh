#!/bin/bash

echo "Running pre-commit format check..."

for file in *.txt; do
    if [ -f "$file" ]; then
        if ! head -n 1 "$file" | grep -q "^TITLE:"; then
            echo "Format error in $file"
            echo "Each .txt file must start with TITLE:"
            exit 1
        fi
    fi
done

echo "Format check passed."
exit 0
