#!/bin/bash

# 2021-06-01 - https://python-poetry.org

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
echo "source \$HOME/.poetry/env" >> $HOME/.bashrc
