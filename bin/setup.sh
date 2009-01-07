#!/usr/bin/env bash

for f in ~/settings/config/*
do
	ln -sf $f .${f##*/}
done
