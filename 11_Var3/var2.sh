#!/bin/bash
echo -en "What is your name [ `whoami` ] "
read myname
if [ -z "$myname" ]; then # If the length of the string is zero, return `true`.
    myname=`whoami`
fi
echo "Your name is : $myname"

