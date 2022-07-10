#!/usr/bin/env bash

# installs https://github.com/haikarainen/light and attempts to configure the correct permissions

set -ex

LIGHT_VERSION="v1.2.2"
UDEV_DIRECTORY="/usr/lib/udev/rules.d"

TEMP_DIR="$(mktemp -d)"

(
	cd "$TEMP_DIR"

	git clone https://github.com/haikarainen/light.git .
	git checkout $LIGHT_VERSION

	./autogen.sh
	./configure --with-udev=$UDEV_DIRECTORY
	make
	sudo make install
)

rm -rf $TEMP_DIR

sudo usermod -a -G video "$(whoami)"
