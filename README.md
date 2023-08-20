# VM-Linux
Скрипты для установки ПО и настройки серверов в Proxmox

Для скачивания скриптом можно использовать консольные утилиты. Самые распространенные это `curl` и `wget`. Они как правило уже есть в большинстве дистрибутивов из коробки.
Но если их нет, то их можно очень лешго доустановить.

**Для Debian/Ubuntu/LinuxMint/и другие дистрибутивы на базе Debian**
```bash
sudo apt install wget -y
```
**Для Centos/Fedora**
```bash
yum -y install wget
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
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_1.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_1.sh | sh
```

## `install_2.sh` - Установка Docker и Docker Compose ##
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_2.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_2.sh | sh
```

## `install_3.sh` - Настройка zsh оболочки ##
До скачивания и запуска скрипта нужно запустить оболочку `zsh` и выбрать вариант хранения настроек.
**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_3.sh | sh
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/install_3.sh | sh
```

---

## Чтобы не делать настройки каждый раз, мои файлы с настройками ##
```bash
curl -O https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```
```bash
wget https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/.zshrc
```
