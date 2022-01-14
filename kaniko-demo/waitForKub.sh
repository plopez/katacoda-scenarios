#/bin/bash
PS1="wescale> "
clear

echo "Wait for K8S to be ready"

(until kubectl version
do
    echo ...
    sleep 1
done)
