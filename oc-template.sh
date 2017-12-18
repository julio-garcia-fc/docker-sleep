#!/bin/bash

# oc cluster up --public-hostname=julio-oc.10.238.41.233.nip.io

IMAGES_TEMPLATE=docker-sleep-image-template
oc create -f $IMAGES_TEMPLATE.json 
oc process $IMAGES_TEMPLATE | oc create -f -

