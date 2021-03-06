#!/bin/bash

# oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io
oc cluster up

SSH_PROJECT="github.com:julio-garcia-fc/docker-sleep.git"
SSH_URI="git@${SSH_PROJECT}"
KEY_NAME=sleep-key-rsa
KEY_FILE=sleep-key_rsa
oc secrets new-sshauth $KEY_NAME --ssh-privatekey=$PWD/$KEY_FILE
oc annotate secret/$KEY_NAME "build.openshift.io/source-secret-match-uri-1=ssh://${SSH_PROJECT}"
oc secrets link builder $KEY_NAME

# ssh-add ./$KEY_FILE
echo "-------------------------------------------------------------"
# oc new-app --source-secret=$KEY_NAME --strategy=docker centos~$SSH_URI
oc new-app --strategy=docker centos~$SSH_URI
