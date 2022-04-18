#!/bin/bash

# - Assumes your Go installation goes in /usr/local/go
# - Assumes you're using Bash
# - Assumes you want the Linux amd64 build

function getStatusCode() {
	set +e
	bash -c "$1" > /dev/null 2>&1
	echo $?
	set -e
}

if [ "$1" == "" ]; then
    echo "Usage: ./go.sh [VERSION]"
    echo "Please specify a version."
    exit 1
fi

TEMP_DIR=$(mktemp --directory)

set -ex

VERSION=$1

FILENAME="go$VERSION.linux-amd64.tar.gz"
DL_URL="https://go.dev/dl/$FILENAME"

FILENAME="$TEMP_DIR/$FILENAME"

BASH_PROFILE="$HOME/.bashrc"

# Remove old installation temp dirs
if [ -e "$TEMP_DIR" ]; then
    rm -rf $TEMP_DIR
fi
mkdir -p $TEMP_DIR

wget --output-document=$FILENAME $DL_URL
tar -C $TEMP_DIR -xzf $FILENAME

# In the instance we're not installing fresh...
if [ -e "/usr/local/go" ]; then
	sudo rm -r /usr/local/go
fi

sudo mv $TEMP_DIR/go /usr/local

# Check Bash profile to see if we've got env vars set yet
if [ $(getStatusCode "cat $BASH_PROFILE | grep /usr/local/go/bin") != "0" ]; then
    echo "Adding Go binaries to PATH"
    echo 'export PATH=$PATH:"/usr/local/go/bin"' >> $BASH_PROFILE
fi

cmd="cat $BASH_PROFILE | grep "
cmd=$cmd'\$HOME/go/bin'
if [ $(getStatusCode "$cmd") != "0" ]; then
    echo 'Adding $HOME/go/bin to PATH'
    echo 'export PATH=$PATH:"$HOME/go/bin"' >> $BASH_PROFILE
fi

# Tidy up
rm -r $TEMP_DIR
