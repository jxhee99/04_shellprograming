#!/bin/bash

#   ./getopts1.sh -x -y     => ls -a -l와 비슷한 성격을 가짐

Usage() {
    echo "Usage: $0 {-x|-y}"
    exit 1
}

while getopts xy options 2>/dev/null
do
    case $options in
        x) echo "X nom" ;;
        y) echo "Y nom" ;;
        *) Usage ;;
    esac
done
