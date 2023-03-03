#!/bin/bash

. /root/bin/functions.sh

# 1) telnet server
# 2) ftp server
# 3) ssh server
# 4) web server with server

# 1) telnet server
echo "########## TELNET SERVER ##########"
PkgInst "telnet telnet-server"
SvcEnable "telnet.socket"
echo "[  OK  ] TELNET 설정이 완료되었습니다."

# 2) ftp server
echo "########## FTP SERVER ##########"
PkgInst "vsftpd ftp"    
VsFtpConf
SvcEnable "vsftpd.service"


# 3) ssh server
echo "########## SSH SERVER ##########"
PkgInst "openssh-server openssh-clients openssh"
SshConf
SvcEnable "sshd.service"


# 4) web server with server
echo "########## WEB SERVER ##########"
CheckWebSvc "nginx"
PkgInst "nginx"
NginxConf
SvcEnable "nginx.service"
echo "[  OK  ] WEB UNIT 설정이 완료되었습니다."
