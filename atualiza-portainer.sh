#!/bin/bash

docker pull portainer/portainer-ce
docker stop portainer
docker rm portainer
docker run -d -p 7000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
