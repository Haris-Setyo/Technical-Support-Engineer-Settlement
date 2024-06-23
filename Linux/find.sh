#!/bin/bash

echo "==============================================================="
echo " Please Insert your DIRECTORY and EXTENSION FILE"
echo "-------------------------------------------------------------"
echo ""
read -p "- Input your DIRECTORY (Format ~/Documents/Folder_belajar) = " DIRECTORY
echo ""
read -p "- Input your EXTENSION FILE (Format txt) = " EXTENSION
echo ""
echo "==============================================================="

DIRECTORY=$(eval echo $DIRECTORY)

# Memeriksa apakah direktori yang diberikan sudah ada
if [ ! -d "$DIRECTORY" ]; then
    echo "==============================================================="
    echo "Directory $DIRECTORY does not exist."
    echo "==============================================================="
    exit 1
fi

# Mencari dan menampilkan file dengan ekstensi yang diberikan ada atau tidak
FILES=$(find "$DIRECTORY" -type f -name "*.$EXTENSION")

if [ -z "$FILES" ]; then
    echo "==============================================================="
    echo "No files with extension .$EXTENSION found in $DIRECTORY."
    echo "==============================================================="
else
    echo "==============================================================="
    echo "Files found:"
    echo "$FILES"
    echo "==============================================================="
fi
