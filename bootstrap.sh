#!/usr/bin/env bash

# # # # # CONFIG

# binaries
SUDO="$(which sudo)"
APT="$(which apt)"
GIT="$(which git)"
AP="$(which ansible-playbook)"
AG="$(which ansible-galaxy)"
RM="$(which rm)"
PY="$(which python3)"
PIP="$(which pip3)"

# locations
WORKING="/tmp"
REPO="${WORKING}/bootstrapper"
REPO_URL="https://github.com/bashfulrobot/bootstrapper.git"

# # # # # MAIN

# install dependencies
${SUDO} ${APT} install python3-pip git -y
${SUDO} ${PY} -m ${PIP} install ansible

# throwaway location
cd ${WORKING}
${GIT} clone ${REPO_URL}
cd ${REPO}

# install ansible requirements
${AG} install -r requirements.yaml --ignore-errors --force
# run the bootstrap
${AP} --ask-vault-pass bootstrap.yaml
# cleanup
cd
${RM} -rf ${REPO}

exit 0
