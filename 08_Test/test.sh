#!/bin/sh

echo -en "Please assign the value to variable \$X"
read X
# [^0-9] finds $X which don't consist only of numbers.
# > /dev/null 2>&1 directs any output or errors to the special "null" device, instead of going to the user's screen.
echo $X | grep "[^0-9]" > /dev/null 2>&1

# $? contains the exit value of the last run command.
if [ "$?" -eq "0" ]; then
    # if the grep found something other than 0-9
    # then it's not an integer.
    [ "$X" = "hello" ] && \
        echo "X matches the String \"hello\""

    [ "$X" != "hello" ] && \
        echo "X is not the string \"hello\""

    [ -n "$X" ] && \
        echo "X is of nonzero length"

    [ -f "$X" ] && \
        echo "X is the path of a real file" || \
        echo "No such file: $X"

    [ -x "$X" ] && \
        echo "X is the path of an executable file"

    [ "$X" -nt "/etc/passwd" ] && \
        echo "X is a file which is newer than /etc/passwd"

else
    if [ "$X" -lt "0" ]
    then
        echo "X is less than zero"
    fi

    if [ "$X" -gt "0" ]; then
        echo "X is more than zero"
    fi

    [ "$X" -le "0" ] && \
        echo "X is less than or equal to zero"

    [ "$X" -ge "0" ] && \
        echo "X is more than or equal to zero"

    [ "$X" = "0" ] && \
        echo "X is the string or number \"0\""
            # The grep found only 0-9, so it's an integer.
            # We can safely do a test on it.
fi
