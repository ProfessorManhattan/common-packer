#!/bin/bash

# This script performs maintenance on Packer repositories. It ensures git submodules are
# installed and then copies over base files from the modules. It also generates the
# documentation and performs other miscellaneous tasks.

set -e

# Ensure shared submodule is present
if [ ! -d "./.modules/shared" ]; then
  git submodule add -b master https://gitlab.com/megabyte-space/common/shared.git ./.modules/shared
else
  cd ./.modules/shared
  git checkout master && git pull origin master --ff-only
  cd ../..
fi

source "./.modules/shared/update.lib.sh"

# Ensure dependencies are installed
ensure_node_installed
ensure_jq_installed
ensure_packer_installed
ensure_vagrant_installed

# Ensure appropriate submodules are present
ensure_project_docs_submodule_latest
ensure_bento_submodule_latest
ensure_windows_submodule_latest

# Copy over files from the shared submodule
cp -Rf ./.modules/shared/.github .
cp -Rf ./.modules/shared/.gitlab .
cp -Rf ./.modules/shared/.vscode .
cp ./.modules/shared/.editorconfig .editorconfig
cp ./.modules/shared/CODE_OF_CONDUCT.md CODE_OF_CONDUCT.md

# Apply updates from shared files
copy_project_files_and_generate_package_json
generate_documentation
misc_fixes
remove_unused_packer_platforms

# Warn user about missing virtualization platforms
missing_virtualization_platforms_notice

# Ensure .start.sh is the latest version # TODO: Figure out how to make this work
# cp ./.modules/$REPO_TYPE/.start.sh .start.sh
