#!/usr/bin/env bash

# # # # # CONFIG

# binaries
WHICH="/usr/bin/which"
SUDO="$($WHICH sudo)"
APT="$($WHICH apt)"
GIT="$($WHICH git)"
AV="$($WHICH ansible-playbook)"
RM="$($WHICH rm)"

# locations
WORKING="/tmp"
REPO="${WORKING}/bootstrapper"
REPO_URL="https://github.com/bashfulrobot/bootstrapper.git"

# # # # # MAIN

# install dependencies
${SUDO} ${APT} install ansible git -y

# throwaway location
cd ${WORKING}
${GIT} clone ${REPO_URL}
cd ${REPO}

# run the bootstrap
${AV} --ask-vault-pass bootstrap.yaml

# cleanup
cd
${RM} -rf ${REPO}

exit 0
