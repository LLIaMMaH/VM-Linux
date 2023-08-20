#!/bin/bash
#set -eo pipefail

Green='\e[1;32m'
Yellow='\e[1;33m'
White='\e[1;37m'
End='\e[0m'

notice() {
  echo " $Yellow♦$Green $1 $End"
}

echo "\n\n"
notice "============================================"
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
usermod -aG docker $USER
docker --version
docker compose version

notice "============================================"
notice "=== $White Don't forget to reboot your system $Green ==="
notice "=== $White Не забудьте перезагрузить систему  $Green ==="
notice "=== $White Usage: sudo reboot                 $Green ==="
notice "============================================"

