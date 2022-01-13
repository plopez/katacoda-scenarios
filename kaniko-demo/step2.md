# Building a container on K8S

Imagine now that you need to build your image in a distant CI (incredible...)

The common way is to have an independant CI runner, hosting the Docker Daemon, and doing the exact same thing you did on your local computer.

But why is there a need for another machine / service, if we plan to run our container on K8S. Couldn't we use the existing K8S infrastructure to build our container upon ?

There is an official Docker image, so let's use it.

`printf 'Jello, world!\n\n'`{{execute}}
