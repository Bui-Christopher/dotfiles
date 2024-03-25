#!/bin/bash

# Run the script within a Rust Workspace to gather all crate versions
# TODO: Add params to specify bin/lib or both.
directories=($(ls -d */))

for dir in "${directories[@]}"; do
    dir=${dir%/}
    if [ -f "$dir/Cargo.toml" ]; then
        crate_name=$(basename "$dir")
        new_version=$(cat "$dir/Cargo.toml" | grep -E '^version = "[0-9]+\.[0-9]+\.[0-9]+"$' | cut -d '"' -f2)
        echo "$crate_name: $new_version"
    fi
done

