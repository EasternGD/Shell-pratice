#!/bin/sh
echo type "\"for i in 1 2 3 4 5\""
for i in 1 2 3 4 5
do
    echo Looping ... number $i
done

echo type "\"for i in hello 1 * 2 goodbye\""
for i in hello 1 * 2 goodbye
do
    echo Looping ... i is set to $i
done


