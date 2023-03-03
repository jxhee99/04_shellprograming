#!/bin/bash
#   # ./check_service.sh 192.168.10.10 192.168.10.20
#   ------------------
#   192.168.10.10
#   ------------------
#   svc1    active
#   svc2    active
#
#   ------------------
#   192.168.10.20
#   ------------------
#   svc3    active
#   svc4    active
#   ....

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <IP1> <IP2>"
    exit 1
fi
export FIRST_IP=$1
export SECOND_IP=$2
export BASEDIR=/root/bin

ServiceList() {
# input: str        # ServiceList main
# output: file      # ServiceList main -> main.txt
# functions:  
SERVER=$1   
ssh $SERVER systemctl -t service | sed -n '1,/^LOAD/p' \
                                 | sed '$d' \
                                 | awk '{print $1, $3}' > $BASEDIR/$SERVER.txt
}

ServiceList main

