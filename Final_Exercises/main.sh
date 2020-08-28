#!/bin/bash
# Address Book

. ./lib.sh
FILE=".record"

menu()
{
    # Called by do_mesu
    echo
    echo
    echo
    echo
    echo "---- Address Book ----"
    echo "1. List / Search"
    echo "2. Add"
    echo "3. Edit"
    echo "4. Remove"
    echo "q. Quit"
    echo -en "Please enter your selection: "
}

run()
{
    while :
    do
        i=-1
        menu
        read i
        case $i in
            "1")
                echo "Please enter the name(surname, given name or full name) you want to search: "
                read n
                Search "$n"
                ;;
            "2")
                echo "Name:"
                read n
                echo "Phone:"
                read p
                echo "Mail:"
                read m
                Add "$n" "$p" "$m"
                ;;

            "3")
                echo "Please enter the name you want to edit his/her info.:"
                read n
                Search "$n"
                # error 1
                [[ $? == "1" ]] && continue
                n=$NAME
                echo "Which one do you want to modify?"
                echo "(N)ame  [ $NAME ]"
                echo "(P)hone [ $PHONE ]"
                echo "(M)ail  [ $MAIL ]"
                read flag
                flag=$(echo "-$flag" | tr "[A-Z]" "[a-z]")
                if [[ $flag != "n" || $flag != "p" || $flag != "m" ]];then
                    echo "[Error] Unreconised input"
                    continue
                fi
                echo "Please enter the new value: "
                read new_value
                Edit "$n" "$flag" "$new_value"
                Search "$n"
                ;;
            "4")
                echo "Please enter the name you want to remove:"
                read n
                Remove "$n"
                ;;
            "q")
                echo "Goodbye!"
                exit 0
                ;;


            esac
        done
    }

# main()
# Create the record file
rm .record

if [ -f ./"$FILE" ]; then
    echo "[$FILE] already exists"
else
    touch "$FILE"
    # Add some data for test
    Add "Jhihrong, Chen" "+886-961102045" "encorf9241@gmail.com.tw"
    Add "Hungming, Chen" "+886-2-27376585" "hungming@mail.ntust.edu.tw"
    Add "Youming, Hsieh" "+886-2-27301056" "ymhsieh@mail.ntust.edu.tw"
    Add "Menghan, Tsai" "+886-2-27376356" "menghan@mail.ntust.edu.tw"
    Add "Tzuyi, Chuang" "+886-2-27301227" "jtychuang@mail.ntust.edu.tw"
    Add "Naiwen, Chi" "+886-2-27376663" "nwchi@mail.ntust.edu.tw"
fi

run
