#/bin/bash
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

kubectl apply -f friends.yaml
