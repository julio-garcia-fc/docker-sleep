#!/bin/bash

# oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io

PREFIX=docker-sleep

IMAGES_TEMPLATE=${PREFIX}-image-template
oc create -f $IMAGES_TEMPLATE.json 
oc process $IMAGES_TEMPLATE | oc create -f -

sleep 10
oc start-build $PREFIX
oc logs -f bc/$PREFIX

set -x 

INFRA_TEMPLATE=${PREFIX}-infra-template
oc create -f $INFRA_TEMPLATE.json
oc process -p DOCKER_REGISTRY=172.30.1.1:5000 -p ROUTE_HOSTNAME=$1 $INFRA_TEMPLATE | oc create -f -
sleep 10
oc describe $PREFIX
oc rollout latest dc/$PREFIX
oc logs -f dc/$PREFIX
