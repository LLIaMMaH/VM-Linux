# VM-Linux
Скрипты для установки ПО и настройки серверов в Proxmox

Для скачивания скриптом можно использовать консольные утилиты. Самые распространенные это `curl` и `wget`. Они как правило уже есть в большинстве дистрибутивов из коробки.
Но если их нет, то их можно очень лешго доустановить.

**Для Debian/Ubuntu/LinuxMint/и другие дистрибутивы на базе Debian**
```bash
sudo apt install curl wget -y
```
**Для Centos/Fedora**
```bash
yum -y install curl wget
```


## `swap_create.sh` - Создание swap файла (файла подкачки) ##
Создаётся файл `swapfile` заданного размера в корне системы, подключается к системе и добавляется в `/etc/fstab`.

**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh | sudo sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh | sudo sh
```

Если нужно изменить размер swap файла (по умолчанию 6 Gb), то можно **задать его при выполнении скрипта** (Например: `swap_create.sh 10` создаст файл подкачки 10Гб):
```bash
curl -O https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh
```
```bash
wget https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh
```


## `install_1.sh` - Обновим систему и установим необходимый софт ##
В перечень необходимого софта входит следующее:

* [mc](https://midnight-commander.org) - Midnight Commander
* [htop](https://htop.dev) - Htop
* [zip](https://en.wikipedia.org/wiki/Info-ZIP) и [unzip](https://infozip.sourceforge.net/UnZip.html) - ZIP и UnZip
* [curl](https://curl.se) и [wget](https://www.gnu.org/software/wget/) - curl и Wget
* [screenfetch](https://github.com/KittyKatt/screenFetch) - Screenfetch
* [git](https://git-scm.com) - git
* [zsh](https://www.zsh.org) - Zsh

**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_1.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_1.sh | sh
```

## `install_docker.sh` - Установка Docker и Docker Compose ##
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_docker.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_docker.sh | sh
```

## `install_zsh.sh` - Настройка zsh оболочки ##
До скачивания и запуска скрипта нужно запустить оболочку `zsh` и выбрать вариант хранения настроек.
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/setup_zsh.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/setup_zsh.sh | sh
```

---

## Чтобы не делать настройки каждый раз, мой файл с настройками для zsh. ##
```bash
curl -O https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```
```bash
wget -O .zshrc https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```

## Устанавливаем и делаем красивым tmux ##
* [tmux](https://github.com/tmux/tmux/wiki) - tmux
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/is_tmux.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/is_tmux.sh | sh
```


### А можно и только сделать tmux красивым. ###
В домашней директории выполняем:
```bash
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```
Подстраиваем ~/.tmux.conf.local под себя.
Исправляю строки
```
tmux_conf_theme_status_left=" ❐ #S "
tmux_conf_theme_status_right=" #{prefix}#{mouse}#{pairing}#{synchronized}# , %R , %d %b | #{username}#{root} "

...
```
Ищем строку
```text
# -- user customizations -------------------------------------------------------
```
и в конце данного блока настроек добавляем
```text
# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

```

Чтобы можно было перегружать настройки, то давайте добавим для этого горячую клавишу. Открываем файл с настройками:
```bash
nano ~/.tmux.conf
```
и добавляем в него бинд горячей клавиши:
```
bind r source-file ~/.tmux.conf
```
Как это работает? Bind обозначает нажатии основной клавиши, с которой как правило начинается указание, какое действие мы хотим сделать (если вы ещё не перенастроили). Изначально это `Ctrl+B`. После нажатия основного бинда нажимаем `r`.  Если вы это делаете сразу после установки и уже запустили хотя бы одно сессию, то выполните в консоли команду:
```bash
tmux source-file ~/.tmux.conf
```
и вернувшись в сессию сможете перегружать настройки.
Так же можно скачать уже готовый файл с настройками.
```bash
curl -o ~/.tmux/.tmux.conf https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.tmux.conf
```
```bash
wget -O ~/.tmux/.tmux.conf https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.tmux.conf
```
