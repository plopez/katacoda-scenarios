# The right way, on K8S

We can now do the same thing on K8S.

We have a private registry running on K8S for demo purpose :
```sh
export CLUSTER_IP=$(kubectl get services docker-registry -o jsonpath='{.spec.clusterIP}')
curl http://$CLUSTER_IP:5000/v2/_catalog
```{{execute}}

First we create our file. For demo purpose we will store it into a config map.

`cat << EOF > Dockerfile
FROM alpine
CMD ["/bin/echo", "It is alive and built by Kaniko on K8S !!!"]
EOF
`{{execute}}

`kubectl create configmap kaniko-demo --from-file=Dockerfile`{{execute}}

```sh
cat << EOF > kaniko.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    args: ["--dockerfile=/workspace/Dockerfile",
            "--context=dir://workspace",
            "--destination=docker-registry.default.svc:5000/my-super-kaniko-image:latest",
            "--insecure"]
    volumeMounts:
      - name: kaniko-dockerfile
        mountPath: /workspace/Dockerfile
        subPath: Dockerfile
  restartPolicy: Never
  volumes:
    - name: kaniko-dockerfile
      configMap:
        name: kaniko-demo
EOF
```{{execute}}

`kubectl apply -f kaniko.yaml`{{execute}}

Check that the image is created
```
export CLUSTER_IP=$(kubectl get services docker-registry -o jsonpath='{.spec.clusterIP}')
curl http://$CLUSTER_IP:5000/v2/_catalog
```{{execute}}

Load the image and run it
```
docker load --input my-new-super-image.tar
docker run  my-new-super-image
```{{execute}}