#!/bin/bash

if [ "$1" == "" ]; then
    echo "usage: ./yadm.sh [VERSION]"
    echo "Please specify a version"
    exit 1
fi

VERSION=$1

curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/$VERSION/yadm
chmod a+x /usr/local/bin/yadm
