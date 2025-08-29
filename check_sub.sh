#!/bin/bash

DIR=$1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [[ "$1" == "--help" || "$1" == "-help" ]]; then
	echo "usage : $0 [path]"
	exit 0
fi

# go to the directory to check
cd $DIR
for file in *; do
	if ffprobe -v error -select_streams s -show_entries stream=index -of csv=p=0 "$file" | grep -q .; then
    		echo -e "$file : ${GREEN}subtitles found${NC}"
	else
    		echo -e "$file : ${RED}subtitles not found${NC}"
	fi
done
