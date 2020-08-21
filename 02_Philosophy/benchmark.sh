# !/bin/sh

command1=$(cat ./myfile | grep Test)
command2=$(grep Test ./myfile)

echo "command: cat ./myfile | grep Test" > log
echo "executive time:" >> log
(time for i in {1..1000}; do (echo $command1); done) 2>> log

echo >> log
echo "command: grep Test ./myfile" >> log
echo "executive time:" >> log
(time for i in {1..1000}; do (echo $command2); done) 2>> log
cat log
