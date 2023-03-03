#!/bin/bash

TMP1=/tmp/tmp1

export LANG=en_US.UTF-8
DATE=$(date +'%Y.%M.%H %H:%M:%S')
# echo -n "Enter your name : "
# read NAME
NAME="KIM JU HEE"
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPUS=$(lscpu | grep '^CPU(s):' | awk '{print $2}')
MEM=$(free -h | grep '^Mem:' | awk '{print $2}')
DISKSC=$(lsblk -S | awk '$3 == "disk" {print $3}' | wc -l)

cat << EOF

Server Vul. Checker version 1.0
DATE: $DATE
NAME: $NAME

(1) Server Information
===========================================
OS      : $OS
Kernel  : $KERNEL
CPU     : $CPUS
MEM     : $MEM
DISK    : $DISKSC
EOF


nmcli connection | grep -vw ' -- ' | tail -n +2 | awk '{print $4}' > $TMP1
DNS=$(for i in $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
do
    echo -n "$i "
done
)

SEQ=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | wc -l)
for i in $(seq $SEQ)
do
    NIC=$(sed -n "${i}p" $TMP1)
    cat << EOF
Network ${i} ($NIC):
    * IP: $(ifconfig ens33 | grep 'inet ' | awk '{print $2}')
    * Netmask: $(ifconfig ens33 | grep 'inet ' | awk '{print $4}')
EOF
done
echo " * Defaultrouter: $(ip route | grep default | awk '{print $3}')"
echo " * DNS: $DNS "