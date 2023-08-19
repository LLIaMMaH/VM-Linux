#!/bin/bash
set -eo pipefail
         
command_exists() {
    command -v "$@" > /dev/null 2>&1
}

sh_c='sh -c'
if [ "$user" != 'root' ]; then
    if command_exists sudo; then
        sh_c='sudo -E sh -c'
    elif command_exists su; then
        sh_c='su -c'
    else
        cat >&2 <<-'EOF'
        Error: this installer needs the ability to run commands as root.
        We are unable to find either "sudo" or "su" available to make this happen.
EOF
        exit 1
    fi
fi


$sh_c 'apt update && apt full-upgrade -y'
$sh_c 'apt install mc htop zip unzip screenfetch zsh curl wget git -y'

$sh_c 'curl -fsSL https://get.docker.com -o get-docker.sh'
$sh_c 'sh ./get-docker.sh'
$sh_c 'usermod -aG docker $USER'
$sh_c 'docker --version'
$sh_c 'docker compose version'
$sh_c "echo 'Don\'t forget to reboot your system'"

