# VM-Linux
Скрипты для установки ПО и быстрой настройки этого ПО в виртуальных машинах в Proxmox. Но можно и просто их использовать, в обычном дистрибутиве на базе `Debian`/`Ubuntu`/`LinuxMint`.  

Для скачивания скриптов можно использовать консольные утилиты. Самые распространенные это `curl` и `wget`. Они как правило уже есть в большинстве дистрибутивов из коробки.  
Но если их нет, то их можно очень лешго доустановить.  

**Для Debian/Ubuntu/LinuxMint/и другие дистрибутивы на базе Debian**
```bash
sudo apt install curl wget -y
```
**Для Centos/Fedora**
```bash
yum -y install curl wget
```


---
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


---
## `install_1.sh` - Обновим систему и установим необходимый софт ##
В перечень необходимого софта входит следующее:  

* [mc](https://midnight-commander.org) - Midnight Commander  
* [btop](https://github.com/aristocratos/btop?tab=readme-ov-file) - Btop  
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
---

**Уже не использую:**
* [htop](https://htop.dev) - Htop


---
## `install_docker.sh` - Установка Docker и Docker Compose ##
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_docker.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_docker.sh | sh
```


---
## `install_zsh.sh` - Настройка zsh оболочки ##
До скачивания и запуска скрипта нужно запустить оболочку `zsh` и выбрать вариант хранения настроек. Я выбираю вариант `2`, который сохранит настройки в `~/.zshrc` файл. Потом оболочку можно закрыть (я это делаю комбинацией клавиш `Ctrl+D` - exit).  
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/setup_zsh.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/setup_zsh.sh | sh
```

Если вам не понравится тема, то её можно легко поменять. [Выберите тему](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes), которая вас устроит и пропишите её в файле `~/.zshrc`.
```bash
nano ~/.zshrc
```
Находит строку `ZSH_THEME="название_темы"` и меняем название на то, что вам нужно.


## Чтобы не делать настройки каждый раз, мой файл с настройками для zsh. ##
```bash
curl -O https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```
```bash
wget -O .zshrc https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```


---
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


## Мониторинг
Установка `Node exporter` для сбора метрик. Запускать от имени пользователя `root` или имеющего данные привелегии.  
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/files/prometheus_node_exporter.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/files/prometheus_node_exporter.sh | sh
```

## QEMU Guest Agent
Перед установкой агента в гостевой ОС убедитесь, что он включён в настройках виртуальной машины:  
1. Остановите ВМ (если она запущена).  
2. В веб-интерфейсе Proxmox выберите ВМ → **Hardware** → **Options** → **QEMU Guest Agent** → включите галочку **Enable**.  
3. Сохраните изменения и запустите ВМ.  

### **Установка гостевого агента в Debian 12.10**
1. Подключитесь к виртуальной машине (через консоль Proxmox или SSH).
2. Обновите пакеты и установите `qemu-guest-agent`:
```bash
sudo apt update
sudo apt install -y qemu-guest-agent
```
- Запустите службу и включите автозагрузку:
```bash
sudo systemctl start qemu-guest-agent
sudo systemctl enable qemu-guest-agent
```
- Проверьте статус:
```bash
sudo systemctl status qemu-guest-agent
```
Должен быть статус **active (running)**.  

**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/files/qemu_guest_agent.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/files/qemu_guest_agent.sh | sh
```
