# Building a container on K8S

Imagine now that you need to build your image in a distant CI (incredible...)

The common way is to have an independent CI runner, hosting the Docker Daemon, and doing the exact same thing you did on your local computer.

But why is there a need for another machine / service, if we plan to run our container on K8S. Couldn't we use the existing K8S infrastructure to build our container upon ?

There is an official Docker image, so let's use it.

First we create a pod running docker, and we add a sleep command to have time to enter it :
```sh
cat << EOF > docker.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: docker
spec:
  containers:
  - name: docker
    image: docker
    args: ["sleep", "10000"]
  restartPolicy: Never
EOF
```{{execute}}

and run it on K8S :

`kubectl apply -f docker.yaml`{{execute}}

Then, we exevute a shell into the image
`kubectl exec -ti docker -- sh`{{execute}}
