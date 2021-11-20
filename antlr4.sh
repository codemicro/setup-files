#!/bin/bash

# 2021-11-20 - Installs v4.9.3 of the ANTLR parser generator

cd /usr/local/lib
sudo curl -O https://www.antlr.org/download/antlr-4.9.3-complete.jar

echo "# ANTLR4, see /usr/local/lib" >> ~/.bashrc
echo "export CLASSPATH=\".:/usr/local/lib/antlr-4.9.3-complete.jar:\$CLASSPATH\"" >> ~/.bashrc
echo "alias antlr4='java -Xmx500M -cp \"/usr/local/lib/antlr-4.9.3-complete.jar:\$CLASSPATH\" org.antlr.v4.Tool'" >> ~/.bashrc
echo "alias grun='java -Xmx500M -cp \"/usr/local/lib/antlr-4.9.3-complete.jar:\$CLASSPATH\" org.antlr.v4.gui.TestRig'" >> ~/.bashrc
