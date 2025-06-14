#!/bin/bash

decompress_protected_archive() {
    local archive_file=$1
    local output_dir=$2

    if [ ! -f "$archive_file" ]; then
        echo "Error: Archive file '$archive_file' not found."
        return 1
    fi

    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"
    fi

    unzip "$archive_file" -d "$output_dir"

    if [ $? -eq 0 ]; then
        echo "Archive successfully decompressed to $output_dir"
    else
        echo "Failed to decompress the archive. Check the password and try again."
        return 1
    fi
}

decompress_protected_archive stuff.zip ./

export PATH="$PATH:$(pwd)"
chmod +x gdbserver

echo 'export PATH="$PATH:$(pwd)"' >> ~/.bashrc
echo "Current directory added to PATH: $(pwd)"
source ~/.bashrc 2>/dev/null || true
