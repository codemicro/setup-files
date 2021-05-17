#!/bin/bash

# 2021-05-02

add-apt-repository ppa:git-core/ppa
apt update
apt install -y git

# Configures global gitignore file - edit ~/.config/global.gitignore and add rules
touch ~/.config/global.gitignore
git config --global core.excludesFile '~/.config/global.gitignore'
