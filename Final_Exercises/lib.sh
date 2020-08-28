Search()
{
    SearchNameByKeyword=`cut -d : -f 1 $FILE | grep "$1"`
    # Find the relevant data by the specific name.
    result=$(cut -d : -f 1-3 $FILE | grep "$SearchNameByKeyword")
    NAME=$(echo "$result" | cut -d : -f 1)
    PHONE=$(echo "$result" | cut -d : -f 2)
    MAIL=$(echo  "$result" | cut -d : -f 3)
    echo "$NAME $PHONE $MAIL" | grep --color=auto  "$NAME"
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
    cat $FILE
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
                "-n")
                    NAME=$3
                    ;;
                "-p")
                    PHONE=$3
                    ;;
                "-m")
                    MAIL=$3
                    ;;
            esac
        fi
        content+="$NAME:$PHONE:$MAIL\n"
    done < $FILE
    echo -e $content > $FILE
    # cat $FILE

}
