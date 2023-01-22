#!/bin/bash

NAMESPACE=$1
RED='\033[0;31m'
NC='\033[0m'

printf "${RED}Clever delete of "$1" commenced \n${NC}"
kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
sed -i -e 's/"kubernetes"//' $NAMESPACE.json
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
printf "\n${RED}Got that disgusting shit out of here... you may continue."