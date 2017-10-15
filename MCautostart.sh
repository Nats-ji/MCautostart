#!/bin/bash

# CONFIG
MCPATH="/home/minecraft/server/direwolf1.13.0"
MCRUNSCRIPT="ServerStart.sh"
MCNAME="FTBserver-1.10.2-12.18.3.2316-universal.jar"
LOCK=".lock"
SCREENNAME="dire"

# LOCAL VARS
lockpath="./${LOCK}"

# 1. Check if MC is runnig and exit script if so.
if [ -n "$(ps aux | grep "${MCNAME}" | grep -v "grep")" ]; then
    exit 0
fi

# 2. Check if lock file doesn't exists
if [ ! -e $lockpath ]; then
    touch $lockpath
else
    exit 0
fi

# 3. Check if screen exist and is detached. If yes then run Minecraft on it.
if [ -n "$(screen -ls \| grep \"${SCREENNAME}\" \| grep \"\(Detached\)\")" ]; then
    $(screen -S ${SCREENNAME} -p 0 -X stuff "cd ${MCPATH}; bash ./${MCRUNSCRIPT}`echo -ne '\015'`")
fi

# 4. Remove lock files
rm ${lockpath}