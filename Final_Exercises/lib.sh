Search()
{
    SearchNameByKeyword=`cut -d : -f 1 $FILE | grep "$1"`
    # Find the relevant data by the specific name.
    cut -d : -f 1-3 $FILE | grep --color=auto "$SearchNameByKeyword"
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
    new_lines=""
    while read line; do
        new_lines=$(echo $line | tr ":" "_")
        # [[ "$line" != *"$1"* ]] && new_lines+="${line}\n"
    done < $FILE
    #  echo -e $new_lines > $FILE
    #  cat $FILE

}
