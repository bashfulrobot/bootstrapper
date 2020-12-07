#!/usr/bin/env bash

sudo apt install ansible git -y

cd /tmp
git clone https://github.com/bashfulrobot/bootstrapper.git
cd bootstrapper

ansible-playbook --ask-vault-pass bootstrap.yaml

exit 0
