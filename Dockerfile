# Base off the Docker container that includes Alpine for installing packages.
FROM ntc-registry.githost.io/nextthingco/chiptainer_alpine

RUN apk update && apk add make && apk add gcc && apk add g++ && \
        apk add flex && apk add bison && apk add git && \
        # Download python and tools for installing libraries
        apk add python-dev && apk add py-setuptools && \


        # Remove build tools, which are no longer needed after installation
        apk del git && apk del make && apk del gcc && apk del g++ && apk del flex && apk del bison


ENTRYPOINT /bin/sh


