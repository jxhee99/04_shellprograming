#!/bin/bash

IP1=server2
UNAME=root
UPASS=centos

CMD() {
    sleep 2 ; echo "$UNAME"
    sleep 1 ; echo "$UPASS"
    sleep 1 ; echo "tar cvzf /tmp/$IP1.tar.gz /home"  # $IP1 = 임의로 지정하겠다.
    sleep 1 ; echo 'date'
    sleep 1 ; echo 'exit'
}
CMD | telnet $IP1 

ftp -n $i 21 << EOF
user $UNAME $UPASS
cd /tmp
lcd /test
bin
hash
prompt
mget $IP1.tar.gz
quit
EOF