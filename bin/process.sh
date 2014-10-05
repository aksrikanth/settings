#!/usr/bin/env bash

if [ $# -eq 0 ]
then
  echo "Usage:"
  echo "process.sh /path/to/tif/files"
  exit 0
fi
if [ -d "$1" ]
then
  cd "$1"
  mkdir -p "../distrib"
  mkdir -p "../web"
  for f in *.tif
  do
    echo "converting $f ... "
    convert "$f" "../distrib/${f%%tif}jpg"
    exiftool -tagsFromFile "$f" -copyright="(c) Srikanth Agaram" "../distrib/${f%%tif}jpg" -overwrite_original
    convert "$f" -resize 1680x1050 "../web/${f%%tif}jpg"
    exiftool -tagsFromFile "$f" -copyright="(c) Srikanth Agaram" "../web/${f%%tif}jpg" -overwrite_original
    echo "done"
  done
else
  echo "$1 is not a directory. Aborting."
fi
