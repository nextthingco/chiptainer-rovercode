# Base off the Docker container that includes Alpine for installing packages.
FROM ntc-registry.githost.io/nextthingco/chiptainer_python_io

RUN apk update && \
	apk add git 


#download rovercode


ENTRYPOINT /bin/sh


