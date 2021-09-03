#!/bin/bash

# Accept argument and store it into variable "FILENAME"
FILENAME=$1

# Make a temporary directory and save the name of said directory 
# into the TEMPFOLDER variable
TEMPFOLDER=$(mktemp -d "temp.XXXXXXXXXXXXXXX")

# Untar and decompress the tar file passed into the program
tar -xzf "$FILENAME" -C "$TEMPFOLDER"

# Look through the files and look for ones that have 
# a "DELETE ME!" string in them.
grep -rl "DELETE ME!" "$TEMPFOLDER" | xargs rm

# Save current directory path to be used later
OLDPATH=$(pwd)

# Go into the temporary folder, if that fails, then exit the program.
cd "$TEMPFOLDER" || exit

# Compress the files in the directory
tar -zcf "cleaned_$FILENAME" "$(basename "$FILENAME" .tgz)"

# Move newly created tar archive to the original directory
mv "cleaned_$FILENAME" "$OLDPATH"
