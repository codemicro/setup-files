#!/bin/bash

# 2021-05-02

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
