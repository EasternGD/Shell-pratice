#!/bin/sh
# Don't run on WSL.
# This program will find out all the files on both WSL and Win10 system.
HTML_FILES=`find / -name "*.html" -print`
echo "$HTML_FILES" HTML_FILES| grep "/index.html$"
echo "$HTML_FILES" HTML_FILES| grep "/contents.html$"
