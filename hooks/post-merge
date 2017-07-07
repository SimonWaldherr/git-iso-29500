#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for F in $(find . -depth -name '*.docx' -type d); do
	echo "$F";
	mv "$F" "$F.tmp"
	cd "$F.tmp/" && zip -r "../$F" * && cd .. && rm -rf "$F.tmp"
done

IFS=$SAVEIFS
