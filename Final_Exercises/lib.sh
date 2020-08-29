Search()
{
    # List the all results
    if [ "$1" == "all" ]; then
        cut -d : -f 1-3 $FILE | tr ":" " "
        return
    fi

    SearchNameByKeyword=`cut -d : -f 1 $FILE | grep "$1"`
    # For count the result
    arr=(`echo $SearchNameByKeyword| tr '\n' '|' | cut -d '|' -f1-`)
    if [ ${#arr[@]} -gt 2 ]; then
        echo "[ERROR] Fuzzy keyword"
        return 2
    fi
    # Find the relevant data by the specific name.
    result=$(cut -d : -f 1-3 $FILE | grep "$SearchNameByKeyword")

    if [ -z "$SearchNameByKeyword" ]; then
        echo "[ERROR] "$1" not found."
        return 1;
    fi
    # echo "$SearchNameByKeyword"
    NAME=$(echo "$result" | cut -d : -f 1)
    PHONE=$(echo "$result" | cut -d : -f 2)
    MAIL=$(echo  "$result" | cut -d : -f 3)

    echo "$NAME $PHONE $MAIL" | grep --color=auto  "$NAME"
}

Confirm()
{
    echo "Are you sure you want to $1 [ $2 ]? (Y/N)"
    read ans
    ans=`echo "$ans" | tr "[A-Z]" "[a-z]"`
    [ "$ans" == 'y' ] && return 0 || return 1
}

Add()
{
    NAME=$1
    PHONE=$2
    MAIL=$3
    echo "$NAME:$PHONE:$MAIL">>$FILE
}

Remove()
{
    new_lines=""
    while read line; do
        [[ "$line" != *"$1"* ]] && new_lines+="${line}\n"
    done < $FILE
    echo -e $new_lines > $FILE
}

Edit()
{
    echo "Parameter: "
    # echo "> 1 - $1"
    # echo "> 2 - $2"
    # echo "> 3 - $3"
    content=""
    while read line; do
        if [[ -z $line ]]; then
            continue
        fi

        NAME=$(echo "$line" | cut -d : -f 1)
        PHONE=$(echo "$line" | cut -d : -f 2)
        MAIL=$(echo "$line" | cut -d : -f 3)
        #        echo "$NAME"
        #        echo "$PHONE"
        #        echo "$MAIL"

        if [[ $1 == $NAME ]]; then
            echo "Modify infomation about [$NAME] ... "
            case $2 in
                "n")
                    NAME="$3"
                    ;;
                "p")
                    PHONE="$3"
                    ;;
                "m")
                    MAIL="$3"
                    ;;

                esac
            fi
            content+="$NAME:$PHONE:$MAIL\n"
        done < $FILE
        echo -e "$content" > $FILE
        # cat $FILE

    }
