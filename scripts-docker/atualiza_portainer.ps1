docker pull portainer/portainer-ce
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 7000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data cr.portainer.io/portainer/portainer-ce:latest