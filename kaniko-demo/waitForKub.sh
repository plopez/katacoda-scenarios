#/bin/bash
PS1="wescale> "
clear

echo "Wait for K8S to be ready"

sleep 1; ./wait.sh
