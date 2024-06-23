#!/bin/bash

key='~/.ssh/id_rsa.pub'
pass=`cat list-server.txt | awk -F" " '{print $3}'`
user=`cat list-server.txt | awk -F" " '{print $1}'`
ip=`cat list-server.txt | awk -F" " '{print $2}'`


cat ~/.ssh/id_rsa.pub | sshpass -p ${pass} ssh ${user}@${ip} 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'