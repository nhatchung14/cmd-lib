#!/bin/bash

if [ $# -eq 0 ];
then
  echo "$0: Missing arguments"
  exit 1
elif [ $# -gt 2 ];
then
  echo "$0: Too many arguments: $@"
  exit 1
else
  echo "We will upload file $1 to folder denoted by the drive folder id"
  echo "The link of folder: https://drive.google.com/drive/u/0/folders/<folder-id>"

fi
./gdrive upload --parent <folder-id> $1
