#!/usr/bin/bash

output=$(curl https://chia.keva.app/)

ip=$(echo "$output" | grep -Po "<td>\d+.\d+.\d+.\d+")
ip=$(echo "$ip" | grep -Po "\d+.\d+.\d+.\d+")

IFS_BAK=$IFS
IFS=$'\n'

for line in $ip
do
  echo "Adding $line"
  cd ~/chia-blockchain
  source activate
  chia show -a "$line:8444"
done