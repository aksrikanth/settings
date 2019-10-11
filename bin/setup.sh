#!/usr/bin/env bash

mkdir -p ~/tmp/undo
mkdir -p ~/tmp/old
for f in ~/settings/dotfiles/*
do
  g=".${f##*/}"
  if [ -f "$g" ]
  then
    if [ -L "$g" ]
    then
      rm -f "$g"
    else
      mv "$g" ~/tmp/old
    fi
  fi
  ln -sf "$f" "$g"
done
