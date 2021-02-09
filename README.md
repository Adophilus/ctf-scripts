# Bash Shell Scripts #

This repo contains some of my commonly used bash shell scrpts for TryHackMe (THM) King Of The Hill (KOTH) challenges

## Preload ##

This is just a folder containing a project I'm working on. It enables the user to execute (dynamically) prepared bash scripts on the target machine. Its still in development though

### Preload (execution) ###
```bash
./run.sh stabilize.sh ../path/to/custom/bash/script.sh persistence/service/backdoor/backdoor-root.sh
```