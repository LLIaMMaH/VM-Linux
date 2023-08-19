# VM-Linux
Скрипты для установки ПО и настройки серверов в Proxmox


`swap_create.sh` - Создание swap файла (файла подкачки)
Создаётся файл `swapfile` заданного размера в корне системы, подключается к системе и добавляется в `/etc/fstab`.

```bash
curl -s https://raw.githubusercontent.com/LLIaMMaH/VM-Linux/main/swap_create.sh
```
