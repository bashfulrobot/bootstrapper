#!/usr/bin/env bash

# # # # # CONFIG

# binaries
SUDO="$(which sudo)"
APT="$(which apt)"
GIT="$(which git)"
AP="$(which ansible-playbook)"
AG="$(which ansible-galaxy)"
RM="$(which rm)"

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

# install ansible requirements
${AG} install -r requirements.yaml --ignore-errors --force -p ./roles
# run the bootstrap
${AP} --ask-vault-pass bootstrap.yaml
# cleanup
cd
${RM} -rf ${REPO}

exit 0
