#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for F in $(find . -depth -name '*.docx' -type f); do
	echo "$F";
	unzip "$F" -d "${F%.*}..docx/" && rm "$F";
	mv "${F%.*}..docx" "$F";
	find "$F" -name "*.xml" -type f -exec sed -i '' $'s/\/>/\/>\\\n/g' {} \;
	find "$F" -name "*.xml" -type f -exec sed -i '' '/^$/d' {} \;
done

IFS=$SAVEIFS
