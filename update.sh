#!/bin/bash

# This script performs maintenance on this repository. It ensures git submodules are
# installed and then copies over base files from the modules. It also generates the
# documentation.

set -ex

# Ensure submodules are present and up-to-date
if [ ! -d "./.modules/bento" ]; then
  git submodule add -b master https://github.com/chef/bento.git ./.modules/bento
else
  cd ./.modules/bento
  git checkout master && git pull origin master
  cd ../..
fi
if [ ! -d "./.modules/docs" ]; then
  git submodule add -b master https://gitlab.com/megabyte-space/documentation/packer.git ./.modules/docs
else
  cd ./.modules/docs
  git checkout master && git pull origin master
  cd ../..
fi
if [ ! -d "./.modules/shared" ]; then
  git submodule add -b master https://gitlab.com/megabyte-space/common/shared.git ./.modules/shared
else
  cd ./.modules/shared
  git checkout master && git pull origin master
  cd ../..
fi

# Copy over files from the shared submodule
cp -Rf ./.modules/shared/.github .
cp -Rf ./.modules/shared/.gitlab .
cp -Rf ./.modules/shared/.vscode .
cp ./.modules/shared/.editorconfig .editorconfig
cp ./.modules/shared/CODE_OF_CONDUCT.md CODE_OF_CONDUCT.md

# Copy files over from the Packer shared submodule
if [ -f ./package.json ]; then
  # Retain package.json "name", "description", and "version"
  PACKAGE_DESCRIPTION=$(cat package.json | jq '.description')
  PACKAGE_NAME=$(cat package.json | jq '.name')
  PACKAGE_VERSION=$(cat package.json | jq '.version')
  cp -Rf ./.modules/packer/files/ .
  jq --arg a ${PACKAGE_DESCRIPTION//\/} '.description = $a' package.json > __jq.json && mv __jq.json package.json
  jq --arg a ${{PACKAGE_NAME//\/} '.name = $a' package.json > __jq.json && mv __jq.json package.json
  jq --arg a ${PACKAGE_VERSION//\/} '.version = $a' package.json > __jq.json && mv __jq.json package.json
  npx prettier-package-json --write
else
  cp -Rf ./.modules/packer/files/ .
fi

# Ensure the pre-commit hook is executable
chmod 755 .husky/pre-commit

# Generate the documentation
jq -s '.[0] * .[1]' template.json ./.modules/docs/common.json > __bp.json | true
npx -y @appnest/readme generate --config __bp.json --input ./.modules/docs/blueprint-contributing.md --output CONTRIBUTING.md | true
npx -y @appnest/readme generate --config __bp.json --input ./.modules/docs/blueprint-readme.md | true
rm __bp.json

echo "*** Done updating meta files and generating documentation ***"
