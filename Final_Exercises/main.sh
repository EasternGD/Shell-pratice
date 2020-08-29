#!/bin/bash
# Address Book

. ./lib.sh
FILE=".record"

menu()
{
    # Called by menu
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
    printf "Please enter your selection: "
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
                printf "Please enter the name(surname, given name or full name) you want to search: "
                read n
                Search "$n"
                ;;
            "2")
                printf "[Name] "
                read n
                printf "[Phone] "
                read p
                printf "[Mail] "
                read m
                Confirm "add" "$n"
                Add "$n" "$p" "$m"
                Search "$n"
                ;;

            "3")
                printf "Please enter the name you want to edit his/her info.: "
                read n
                Search "$n"
                # error 1
                [[ $? == "1" ]] && continue
                n=$NAME
                Confirm "edit" "$n"
                [ "$?" -eq "1" ] && continue
                echo "(N)ame  [ $NAME ]"
                echo "(P)hone [ $PHONE ]"
                echo "(M)ail  [ $MAIL ]"
                printf "Which one do you want to modify? "
                read flag
                flag=${flag,,}
                if [[ $flag != "n" ]] && [[ $flag != "p" ]] && [[ $flag != "m" ]]; then
                    echo "[Error] Unreconised input"
                    continue
                fi
                printf "Please enter the new value: "
                read new_value
                Edit "$n" "$flag" "$new_value"
                [ $flag == "n" ] && n=$new_value
                Search "$n"
                ;;
            "4")
                printf "Please enter the name you want to remove:"
                read n
                Search "$n"
                Confirm "remove" "$n"
                [ "$?" -eq "1" ] && continue
                Remove "$n"
                Search "all"
                Search "$n"
                echo "Done!"
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
