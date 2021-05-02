#!/bin/bash

# 2021-05-02

wget -qO - https://typora.io/linux/public-key.asc | apt-key add -
add-apt-repository 'deb https://typora.io/linux ./'
apt-get update
apt-get install typora
