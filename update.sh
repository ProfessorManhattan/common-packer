#!/bin/bash

# This script performs maintenance on this repository. It ensures git submodules are
# installed and then copies over base files from the modules. It also generates the
# documentation.

set -e

git submodule update --init --recursive

if [ ! -d "./modules/bento" ]; then
  cd modules
  git submodule add -b master https://github.com/chef/bento.git
  cd ..
else
  cd modules/bento
  git checkout master && git pull origin master
  cd ../..
fi
if [ ! -d "./modules/docs" ]; then
  cd modules
  git submodule add -b master https://gitlab.com/megabyte-space/documentation/packer.git docs
  cd ..
else
  cd modules/docs
  git checkout master && git pull origin master
  cd ../..
fi
if [ ! -d "./modules/shared" ]; then
  cd modules
  git submodule add -b master https://gitlab.com/megabyte-space/common/shared.git
  cd ..
else
  cd modules/shared
  git checkout master && git pull origin master
  cd ../..
fi
cp -rf ./modules/shared/.github .
cp -rf ./modules/shared/.gitlab .
cp -rf ./modules/shared/.vscode .
cp ./modules/shared/.cspell.json .cspell.json
cp ./modules/shared/.editorconfig .editorconfig
cp ./modules/shared/.mdlrc .mdlrc
cp ./modules/shared/.prettierrc .prettierrc
cp ./modules/shared/CODE_OF_CONDUCT.md CODE_OF_CONDUCT.md
cp -Rf ./modules/packer/files/ .
jq -s '.[0] * .[1]' template.json ./modules/docs/common.json > __bp.json | true
npx -y @appnest/readme generate --config __bp.json --input ./modules/docs/blueprint-contributing.md --output CONTRIBUTING.md | true
npx -y @appnest/readme generate --config __bp.json --input ./modules/docs/blueprint-readme.md | true
rm __bp.json
echo "*** Finished scaffolding repository ***"
