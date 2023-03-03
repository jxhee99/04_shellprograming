#!/bin/bash

logger -n 192.168.10.202 -P 514 -T -p local0.notice "hello syslog($RANDOM) from main.example.com"
