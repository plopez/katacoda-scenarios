# Building a container locally

This is the baseline when you work with containers.
You buils them locally, using the Docker Daemon. And everything if fine as long as you do it on your own computer.

Everything starts with a very simple Dockerfile :

`cat Dockerfile\n\n'`{{execute}}

First, we build it :
`docker build -ti my-super-image .\n\n'`{{execute}}

Then, we run it :
`docker run my-super-image\n\n'`{{execute}}

Yeah !
