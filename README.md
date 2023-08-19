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




`swap_create.sh` - Создание swap файла (файла подкачки)
Создаётся файл `swapfile` заданного размера в корне системы, подключается к системе и добавляется в `/etc/fstab`.

**Скачать и сразу выполнить:**
```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh | sudo bash
```
```bash
wget -O - https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh | sudo bash
```

Если нужно изменить размер swap файла (по умолчанию 6 Gb), то можно **просто скачать файл**, отредактировать и выполнить его:
```bash
curl -O https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh
```
```bash
wget https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh
```
