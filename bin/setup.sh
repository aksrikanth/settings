#!/usr/bin/env bash

for f in ~/settings/config/*
do
  [ -f ".${f##*/}" ] && rm -f ".${f##*/}"
	ln -sf $f .${f##*/}
done
