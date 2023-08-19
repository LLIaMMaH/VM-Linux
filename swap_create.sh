#!/bin/bash
         
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

$sh_c 'fallocate -l 6G /swapfile'
$sh_c 'chmod 600 /swapfile'
$sh_c 'mkswap /swapfile'
$sh_c 'swapon /swapfile'

$sh_c "echo '/swapfile none swap sw 0 0' >> /etc/fstab"

