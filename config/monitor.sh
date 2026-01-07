#!/bin/bash
#get this bash code using ChatGPT



LOGFILE="/opt/webapp/logs/monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "----- $DATE -----" >> $LOGFILE

if systemctl is-active --quiet webapp; then
    echo "Webapp service: RUNNING" >> $LOGFILE
else
    echo "Webapp service: NOT RUNNING" >> $LOGFILE
fi

if curl -s --head http://localhost | grep "200 OK" > /dev/null; then
    echo "Nginx: RESPONDING" >> $LOGFILE
else
    echo "Nginx: NOT RESPONDING" >> $LOGFILE
fi

echo "" >> $LOGFILE
