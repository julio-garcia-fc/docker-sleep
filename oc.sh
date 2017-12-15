#!/bin/bash

#oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io

# oc new-project julio 
oc secrets new-sshauth sleep-key-rsa --ssh-privatekey=/home/julio/.ssh/sleep-key_rsa
# oc secrets link builder sleep-key-rsa

# oc new-app $PWD --source-secret=sleep-key-rsa
ssh-add ./sleep-key_rsa
oc new-app --source-secret=sleep-key-rsa git@github-isl-01.ca.com:garju09/docker-sleep.git
