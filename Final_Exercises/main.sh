#!/bin/bash
. ./lib.sh
FILE="record.log"

# main()
# Create the record file
rm *.log
[ -f "./$FILE" ] && echo "Found data file ..." || touch $FILE

Add "Jhihrong, Chen" "+886-961102045" "encorf9241@gmail.com.tw"
Add "Hungming, Chen" "+886-2-27376585" "hungming@mail.ntust.edu.tw"
Add "Youming, Hsieh" "+886-2-27301056" "ymhsieh@mail.ntust.edu.tw"
Add "Menghan, Tsai" "+886-2-27376356" "menghan@mail.ntust.edu.tw"
Add "Tzuyi, Chuang" "+886-2-27301227" "jtychuang@mail.ntust.edu.tw"
Add "Naiwen, Chi" "+886-2-27376663" "nwchi@mail.ntust.edu.tw"

# KEYWORD=""
# while :
#do
#    echo "Give me a name."
#    read KEYWORD
#    echo "\"$KEYWORD\""
#    echo "Search result:"
#    Search $KEYWORD
#done

# Remove "Jhihrong, Chen"
# Remove "Hungming, Chen"
Edit "Naiwen, Chi"
# cat $FILE

