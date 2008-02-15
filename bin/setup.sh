#!/usr/bin/env bash

for f in ~/settings/config/*
do
	ln -s $f ${f##*/}
done
