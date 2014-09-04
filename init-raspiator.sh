#!/bin/bash

# Do some initial work for the introduction of a new raspiator

[ -z "$1" ] && usage

HNAME=$1

usage() {
	echo "Usage: $0 hostname"
	echo "Introduce a new raspiator with name 'hostname'"
	exit 255
}

distributeSSHKey() {
	[ -e "~/.ssh/${HNAME}.pub" ] || ssh-keygen -f ~/.ssh/${HNAME}
	scp ~/.ssh/${HNAME}.pub pi@${HNAME}:
        ssh pi@${HNAME} "mkdir .ssh ; cat ${HNAME}.pub >> .ssh/authorized_keys"
	echo "
Host ${HNAME}
    User pi
    IdentityFile ~/.ssh/${HNAME}
" >> ~/.ssh/config

        PASSWD=$(head -10 /dev/urandom | shasum | base64 | cut -c -25)
	[ -d vault_passwd ] || mkdir vault_passwd
	echo ${PASSWD} > vault_passwd/${HNAME}
	scp vault_passwd/${HNAME} ${HNAME}:.ansible_vault_passwd
}


distributeSSHKey

