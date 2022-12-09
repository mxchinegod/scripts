#!/bin/bash
CONFIG=$1
NAMESPACE=$2
PATH=$3
FILE=$4
POD=$5

if [ "$1" == "-h" ]; then
  echo "Usage: kubeCopy.sh [config] [namespace] [remote path] [local file] [pod]"
  exit 0
else
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  printf "${RED}Copying of "$PATH" from "$POD" in namespace "$NAMESPACE" commenced \n${NC}"
  echo "kubectl --kubeconfig $CONFIG --insecure-skip-tls-verify -n $NAMESPACE cp $POD:$PATH $FILE"
  /Applications/Rancher\ Desktop.app/Contents/Resources/resources/darwin/bin/kubectl --kubeconfig $CONFIG --insecure-skip-tls-verify -n $NAMESPACE cp $POD:$PATH $FILE
  printf "\n${RED}Copy was successful."
fi