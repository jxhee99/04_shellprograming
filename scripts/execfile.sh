#!/bin/bash


echo -n "파일이름은? : " 
read FILE1

# echo $FILE1

: << EOP
if [ -x $FILE1 ] ; then 
    eval $FILE1
fi
EOP
