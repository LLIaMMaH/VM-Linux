#!/bin/bash
         
# Install & Setup tmux

Green='\e[1;32m'
Yellow='\e[1;33m'
White='\e[1;37m'
End='\e[0m'

notice() {
  echo -e " $Yellow♦$Green $1 $End"
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

notice "============================================"
notice "=== $White Install tmux                       $Green ==="
$sh_c 'apt install tmux -y'

notice "=== $White Git clone tmux config              $Green ==="
git clone https://github.com/gpakosz/.tmux.git ~/.tmux

notice "=== $White Download .tmux.conf file           $Green ==="
wget -O ~/.tmux.conf.local https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.tmux.conf.local

ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
#tmux source-file ~/.tmux.conf
source ~/.tmux.conf

notice "============================================"
