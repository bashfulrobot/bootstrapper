#!/usr/bin/env bash

sudo apt install ansible git -y

ansible-playbook --ask-vault-pass bootstrap.yaml

exit 0