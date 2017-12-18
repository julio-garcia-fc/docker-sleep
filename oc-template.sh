#!/bin/bash

# oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io

PREFIX=docker-sleep
IMAGES_TEMPLATE=${PREFIX}-image-template
oc create -f $IMAGES_TEMPLATE.json 
oc process $IMAGES_TEMPLATE | oc create -f -

sleep 5
oc start-build $PREFIX
oc logs -f bc/$PREFIX
