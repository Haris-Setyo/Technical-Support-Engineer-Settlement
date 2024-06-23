#!/bin/bash
y=$(date +'%Y')
m=$(date +'%m')
BACKUP_DIR="/home/flylxy/Document/Backup/${y}/${m}/"
DATE=$(date +'%Y-%m-%d')
loc_DIR="/home/flylxy/Document/mysql"
mkdir -p "${BACKUP_DIR}"

tar cvzf ${BACKUP_DIR}/mysql-${DATE}.tgz ${loc_DIR} 

echo "Backup Done"