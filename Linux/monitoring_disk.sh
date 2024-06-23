#!/bin/sh
# Purpose: Monitor Linux disk space and send an Telegram_Bot alert to Admin
TOKEN="7467803964:AAGO52wWiPnmCHMoDuC1TZm5zcDpz-DWQ7o" # Token bot
CHAT_ID="722009887" # Chat User
ALERT=12 # alert level 
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 " " $4}' | while read -r output;
do
  echo "$output"
  usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$output" | awk '{ print $2 }' )
  avaible=$(echo "$output" | awk '{ print $3 }' )
  if [ $usep -ge $ALERT ]; then
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$(echo "Running out of space $partition ($usep%) and availble space $avaible on $(hostname) as on $(date)")"
  fi
done