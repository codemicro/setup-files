#!/bin/bash

DOWNLOAD_FILE="flutter.tar.xz"

wget -O $DOWNLOAD_FILE https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.5.3-stable.tar.xz

INSTALL_LOCATION="/home/akp"
sudo mkdir -p $INSTALL_LOCATION

(cd $INSTALL_LOCATION; sudo tar xvf $DOWNLOAD_FILE)

echo "export PATH=\"\$PATH:$INSTALL_LOCATION/flutter/bin\"" >> ~/.bashrc
source ~/.bashrc

echo "Checking path..."
which flutter dart

echo "Downloading development dependencides..."
flutter precache

echo "Running flutter doctor"
flutter doctor

echo "Cleaning up"
rm $DOWNLOAD_FILE
