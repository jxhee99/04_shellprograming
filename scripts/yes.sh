#!/bin/bash

echo -n "너의 선택은? (yes/no):"
read CHOICE

case $CHOICE in
    yes|y|YES|Yes|Y) echo "[ OK ] Oh Yes~~~~" ;;
    no|n|NO|No|N) echo "[ FAIL ] Oh N~~O~~~" ;;
    *) echo "[ FAIL ] yes 또는 no을 입력하지 않았네요."
    exit 1 ;;
esac