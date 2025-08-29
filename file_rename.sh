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
for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done
