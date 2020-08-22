#!/bin/bash
. ./common.lib

echo "Create file ... "
for i in {0..9}
do
    touch ${i}.html
done
echo *.html

echo $STD_MSG
rename .html .html-bak
echo *.html-bak
echo "Delete files ... "
rm *.html-bak
echo *.html-bak
echo *.html
