#!/bin/bash

shopt -s nullglob
dumps=(APs* Names*)

if [ ${#dumps[@]} -eq 0 ] ; then
echo "no files that start by 'file'."
else

for files in "${dumps[@]}"; do

if [ -s "$files" ]; then
echo "the file $files has content"
else
echo "the file $files its blank"
echo "deleting $files"
rm -r $files
fi
done
fi
