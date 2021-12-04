#!/bin/bash
current_backend_ip=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' backend`
sudo echo "$current_backend_ip backend" >> /etc/hosts

