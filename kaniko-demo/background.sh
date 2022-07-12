#!/usr/bin/env bash

# dl image on controlplane

docker pull alpine
docker pull docker
docker pull plopezfr/friends-quotes:1.0
docker pull gcr.io/kaniko-project/executor:latest
docker pull registry:2.6.2

crictl pull alpine
crictl pull docker
crictl pull plopezfr/friends-quotes:1.0
crictl pull gcr.io/kaniko-project/executor:latest
crictl pull registry:2.6.2

# dl image on node01

ssh node01 '
docker pull alpine
docker pull docker
docker pull plopezfr/friends-quotes:1.0
docker pull gcr.io/kaniko-project/executor:latest
docker pull registry:2.6.2

crictl pull alpine
crictl pull docker
crictl pull plopezfr/friends-quotes:1.0
crictl pull gcr.io/kaniko-project/executor:latest
crictl pull registry:2.6.2
'