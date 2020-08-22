#!/bin/sh

myfunc()
{
    echo "I was called as : $@"
    x=2
}

## Main
echo "Script was called with $@"
x=1
echo "x is $x"
# OS will start `tee`, then start a new shell to call myfunc(), so x will keep on 1.
myfunc 1 2 3 | tee out.log
echo "x is $x"

