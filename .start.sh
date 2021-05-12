#!/bin/bash

# This script performs maintenance on Packer repositories. It ensures git submodules are
# installed and then copies over base files from the modules. It also generates the
# documentation and performs other miscellaneous tasks.

set -e

if [ "$container" != 'docker' ]; then
  curl -sL https://git.io/_has | bash -s docker git jq node npm wget
fi

export REPO_TYPE=packer
git submodule update --init --recursive
if [ ! -f "./.modules/${REPO_TYPE}/update.sh" ]; then
  git submodule add -b master --depth 1 https://gitlab.com/megabyte-space/common/$REPO_TYPE.git ./.modules/$REPO_TYPE
else
  cd ./.modules/$REPO_TYPE
  git checkout master && git pull --depth 1 --rebase origin master --allow-unrelated-histories
  cd ../..
fi
bash ./.modules/$REPO_TYPE/update.sh
