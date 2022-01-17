# The right way, on K8S

We can now do the same thing on K8S.

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
            "--destination=docker-registry.default.svc:5000"]
```{{execute}}

`kubectl apply -f kaniko.yaml`{{execute}}

Now we will try to build our image with Kaniko, locally :
```
docker run \
  -v $(pwd):/workspace gcr.io/kaniko-project/executor:latest \
  --context dir:///workspace \
  --destination=my-new-super-image:latest \
  --no-push \
  --tarPath=/workspace/my-new-super-image.tar
```{{execute}}

Load the image and run it
```
docker load --input my-new-super-image.tar
docker run  my-new-super-image
```{{execute}}
