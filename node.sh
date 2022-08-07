#!/bin/bash

# - Assumes your Go installation goes in /opt/node
# - Assumes you're using Bash
# - Assumes you want the Linux amd64 build

function getStatusCode() {
	set +e
	bash -c "$1" > /dev/null 2>&1
	echo $?
	set -e
}

if [ "$1" == "" ]; then
    echo "Usage: $0 [VERSION]"
    echo "Please specify a version."
    exit 1
fi

TEMP_DIR=$(mktemp --directory)

set -ex

VERSION=$1

INSTALL_DIR="/opt/node"

# eg: https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz
FILENAME="node-v$VERSION-linux-x64.tar.xz"
DL_URL="https://nodejs.org/dist/v$VERSION/$FILENAME"

FILENAME="$TEMP_DIR/$FILENAME"

BASH_PROFILE="$HOME/.bashrc"

# Remove old installation temp dirs
if [ -e "$TEMP_DIR" ]; then
    rm -rf $TEMP_DIR
fi
mkdir -p $TEMP_DIR

wget --output-document=$FILENAME $DL_URL
tar -C $TEMP_DIR -xf $FILENAME

# In the instance we're not installing fresh...
if [ -e $INSTALL_DIR ]; then
	sudo rm -r $INSTALL_DIR
fi

sudo mv $TEMP_DIR/node-v16.16.0-linux-x64 $INSTALL_DIR

# Check Bash profile to see if we've got env vars set yet
if [ $(getStatusCode "cat $BASH_PROFILE | grep /opt/node/bin") != "0" ]; then
    echo "Adding Node binaries to PATH"
    echo 'export PATH=$PATH:"/opt/node/bin"' >> $BASH_PROFILE
fi

# Tidy up
rm -r $TEMP_DIR
