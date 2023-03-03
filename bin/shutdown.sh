#!/bin/bash

ALIVELIST=/root/bin/alive.txt
> /root/bin/alive.txt           # 안에 내용 삭제하기


cat /root/bin/server.txt | while read IP1 UNAME UPASS
do
    ping -c 1 -W 1 $IP1 > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[  OK  ] $IP1 alive."
        echo "$IP1" >> $ALIVELIST
    else
        echo "[ FAIL ] $IP1 Shutdown."
    fi
done

CMD() {
    sleep 2; echo 'root'
    sleep 1; echo 'centos'
    sleep 1; echo 'poweroff'
    sleep 1; echo 'exit'
}
cat "$ALIVELIST" | while read IP1
do
    CMD | telnet $IP1
done