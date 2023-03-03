#!/bin/bash

NUM=1
for i in $(seq 10)
do
    # (ㄱ) "10%|"
    PERCENT=$(expr $i \* 10)
    echo -n "${PERCENT}%|"

    # (ㄴ) "10%|=="
    for j in $(seq $i)
    do
        echo -ne "=="
    done 
    
    # (ㄷ) "100%|=====================| complete"
    [ $i -le 9 ] && echo -ne ">" || echo -ne "| complete\n"

    echo -ne '>\r'
    sleep 1
done