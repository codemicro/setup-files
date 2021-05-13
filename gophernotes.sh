#!/bin/bash

# GopherNotes - https://github.com/gopherdata/gophernotes
# 2021-05-13

go get github.com/gopherdata/gophernotes
mkdir -p ~/.local/share/jupyter/kernels/gophernotes
cd ~/.local/share/jupyter/kernels/gophernotes
cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.2/kernel/*  "."
chmod +w ./kernel.json
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json

# Test after installation with `"$(go env GOPATH)"/bin/gophernotes`
# You should see a line with the words: `Need a command line argument specifying the connection file.`
