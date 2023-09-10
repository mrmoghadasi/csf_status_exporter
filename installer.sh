#!/bin/bash


mkdir -p /var/lib/node_exporter/textfile_collector/
mkdir -p /usr/lib/csf_status/

cp csf_status.sh /usr/lib/csf_status/
chmod +x /usr/lib/csf_status/csf_status.sh


echo '[Unit]
Description=Run csf_status.sh every 5 seconds

[Service]
ExecStart=/usr/lib/csf_status/csf_status.sh

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/csf_status.service

echo '[Unit]
Description=Run csf_status.service every 5 seconds

[Timer]
OnBootSec=5s
OnUnitActiveSec=5s

[Install]
WantedBy=timers.target' > /etc/systemd/system/csf_status.timer




sudo systemctl daemon-reload

sudo systemctl enable csf_status.service
sudo systemctl enable csf_status.timer

sudo systemctl start csf_status.service
sudo systemctl start csf_status.timer

sudo systemctl status csf_status.service
sudo systemctl status csf_status.timer


