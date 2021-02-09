#!/bin/bash

# variable definitions

PRELOADS="$@"
PRELOAD_PATHS=( "./preloads" ".." )
TMP_PATH="/tmp"
PORTS_FILE="/tmp/preload-ports.txt"
DEFAULT_PORT="9001"

declare -A VARIABLES=(
	["HAS_PYTHON"]="\$(which python)"
	["HAS_PYTHON3"]="\$(which python3)"
	["SERVER_HOST"]="10.10.10.10"
	["SERVER_PORT"]="12345"
	["USERNAME"]="username"
)

if [[ ! -f "$PORTS_FILE" ]];
then
	echo "$DEFAULT_PORT" > "$PORTS_FILE"
	USED_PORTS=( "9001" )
else
	USED_PORTS=()
	for port in $(cat "$PORTS_FILE");
	do
		USED_PORTS+=( "$port" )
	done
fi