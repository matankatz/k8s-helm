#!/bin/bash

set -eo pipefail

# import TAG
source TAG

#
echo "--- Update Dockerfile with the tags"

# check OS version
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]
then
  sed -i "" 's/\(HELM_LATEST_VERSION \)\(.*\)/\1'${HELM_TAG}'/g' Dockerfile
else
  sed -i 's/\(HELM_LATEST_VERSION \)\(.*\)/\1'${HELM_TAG}'/g' Dockerfile
fi

#
echo "--- Done"
