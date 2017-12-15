#!/bin/bash -x

oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io

# SSH_URI="git@github-isl-01.ca.com:garju09/docker-sleep.git"
SSH_URI="git@github.com:julio-garcia-fc/docker-sleep.git"
KEY_NAME=sleep-key-rsa
KEY_FILE=sleep-key_rsa
oc secrets new-sshauth $KEY_NAME --ssh-privatekey=./$KEY_FILE
oc annotate secret/$KEY_NAME "build.openshift.io/source-secret-match-uri-1=ssh://${SSH_URI}"
oc secrets link builder $KEY_NAME

# oc new-app $PWD --source-secret=$KEY_NAME
# ssh-add ./$KEY_FILE
oc new-app --source-secret=$KEY_NAME $SSH_URI
# oc new-app git@github-isl-01.ca.com:garju09/docker-sleep.git
