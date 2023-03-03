#!/bin/bash

logger -n 192.168.10.202 -P 514 -d -p local0.warning "hello syslog($RANDOM) from main.example.com"
sleep 0.5
logger –n 192.168.10.202 -P 514 -d -p local0.crit "Test syslog($RANDOM) from main.example.com"
