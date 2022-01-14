#/bin/bash
PS1="wescale> "
clear

until kubectl version
do
    echo ...
    sleep 1
done
