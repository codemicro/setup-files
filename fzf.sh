#!/bin/bash

# - Assumes your fzf installation goes in ~/.local/bin and the config goes in ~/.config/fzf
# - Assumes you want the Linux amd64 build

if [ "$1" == "" ]; then
    echo "Usage: $0 [VERSION]"
    echo "Please specify a version."
    exit 1
fi

TEMP_DIR=$(mktemp --directory)

set -ex

VERSION=$1

FILENAME="fzf-$VERSION-linux_amd64.tar.gz"
DL_URL="https://github.com/junegunn/fzf/releases/download/$VERSION/$FILENAME"

FILENAME="$TEMP_DIR/$FILENAME"

# Remove old installation temp dirs
if [ -e "$TEMP_DIR" ]; then
    rm -rf $TEMP_DIR
fi
mkdir -p $TEMP_DIR

wget --output-document=$FILENAME $DL_URL
tar -C $TEMP_DIR -xzf $FILENAME

# In the instance we're not installing fresh...
if [ -e "$HOME/.local/bin/fzf" ]; then
	sudo rm -r $HOME/.local/bin/fzf
fi

mv $TEMP_DIR/fzf $HOME/.local/bin

# Tidy up
rm -r $TEMP_DIR

echo -e 'You may need to install keybindings and autocompletion seperately.\nhttps://github.com/junegunn/fzf'
