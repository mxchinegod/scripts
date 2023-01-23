#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

CONFIG=$1
NAMESPACE=$2
PATH=$3
FILE=$4
POD=$5

# This is a shell script that is used to copy files from a pod to the local machine.
if [ "$1" == "-h" ]; then
  purple "🛟 copy.sh [config] [namespace] [remote path] [local file] [pod]"
  exit 0
else
  purple "🗂️ Copying of "$PATH" from "$POD" in "$NAMESPACE" commenced \n$"
  echo "kubectl --kubeconfig $CONFIG --insecure-skip-tls-verify -n $NAMESPACE cp $POD:$PATH $FILE"
  purple "\n✅ Copy was successful."
fi