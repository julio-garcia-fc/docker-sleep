#!/bin/bash

docker run --name sleep -d julio/sleep3600
sleep 5
docker exec sleep cat /etc/hosts
