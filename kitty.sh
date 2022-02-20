#!/bin/bash

set -ex

# TEMP_DIR="/tmp/kittyInstall"
#
# mkdir -p $TEMP_DIR
#
# (
# 	cd $TEMP_DIR
#	wget https://github.com/kovidgoyal/kitty/releases/download/v0.24.2/kitty-0.24.2-x86_64.txz
# 	tar xvf kitty-0.24.2-x86_64.txz
# 	sudo cp bin/kitty /usr/local/bin
# )
#
# rm -rf $TEMP_DIR

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
