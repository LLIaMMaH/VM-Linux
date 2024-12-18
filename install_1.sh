#!/bin/bash
#set -eo pipefail

Green='\e[1;32m'
Yellow='\e[1;33m'
White='\e[1;37m'
End='\e[0m'

notice() {
  echo " $Yellow♦$Green $1 $End"
}

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
        Error: this script needs the ability to run commands as root.
        We are unable to find either "sudo" or "su" available to make this happen.
EOF
        exit 1
    fi
fi

echo "\n\n"
notice "============================================"
$sh_c 'apt update && apt full-upgrade -y && apt autoremove -y && apt autoclean -y'
$sh_c 'apt install mc btop zip unzip curl wget screenfetch git zsh -y'

notice "============================================"
notice "=== $White Don't forget to reboot your system $Green ==="
notice "=== $White Не забудьте перезагрузить систему  $Green ==="
notice "=== $White Usage: sudo reboot                 $Green ==="
notice "============================================"

