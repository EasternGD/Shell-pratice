#!/bin/bash
. ./common.lib

echo "Create file ... "
for i in {0..9}
do
    touch ${i}.txt
done
echo *.txt

echo $STD_MSG
rename .txt .bat
echo *.bat
echo "Delete files ... "
rm *.bat
echo *.bat
echo *.txt
