#!/usr/bin/env bash
cat << EOF > friends.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: friends
spec:
  containers:
  - name: friends
    image: plopezfr/friends-quotes:1.0
  restartPolicy: Never
EOF
docker pull plopezfr/friends-quotes:1.0

sleep 2

kubectl apply -f friends.yaml

ssh node01 'docker run -d --name=friends plopezfr/friends-quotes:1.0'

sleep 2

kubectl apply -f registry.yaml
