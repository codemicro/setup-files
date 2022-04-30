#!/bin/bash

# - Assumes your nfty installation goes in /usr/local/bin
# - Assumes you're using Bash
# - Assumes you want the Linux x86_64 build

function getStatusCode() {
	set +e
	bash -c "$1" > /dev/null 2>&1
	echo $?
	set -e
}

if [ "$1" == "" ]; then
    echo "Usage: ./ntfy-cli.sh [VERSION]"
    echo "Please specify a version."
    exit 1
fi

TEMP_DIR=$(mktemp --directory)

set -ex

VERSION=$1

VERSION_STRING="ntfy_${VERSION}_linux_x86_64"
FILENAME="$VERSION_STRING.tar.gz"
DL_URL="https://github.com/binwiederhier/ntfy/releases/download/v$VERSION/$FILENAME"

FILENAME="$TEMP_DIR/$FILENAME"

wget --output-document=$FILENAME $DL_URL
tar -C $TEMP_DIR -xzf $FILENAME

# In the instance we're not installing fresh...
if [ -e "/usr/local/bin/ntfy" ]; then
	sudo rm /usr/local/bin/ntfy
fi

sudo mv $TEMP_DIR/$VERSION_STRING/ntfy /usr/local/bin

# Tidy up
rm -r $TEMP_DIR
