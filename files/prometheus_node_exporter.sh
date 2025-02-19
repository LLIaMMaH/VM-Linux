#!/bin/bash

# https://github.com/prometheus/node_exporter/releases
NODE_EXPORTER_VERSION="1.9.0"

cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
tar xvfz node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
cd node_exporter-$NODE_EXPORTER_VERSION.linux-amd64

sudo mv node_exporter /usr/bin/
sudo rm -rf /tmp/node_exporter*

sudo useradd -rs /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/bin/node_exporter


sudo cat <<EOF> /etc/systemd/system/node_exporter.service
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
ExecStart=/usr/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl status node_exporter
node_exporter --version
