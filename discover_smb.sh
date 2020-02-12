#!/bin/bash
mounts=$(cat /etc/fstab | grep cifs | tr -s ' ' | cut -d ' ' -f 2)
paths=()
for mount in $mounts
do
  paths+=("{\"{#SMBNAME}\": \"$mount\"}")
done
result=$(IFS=,; echo "${paths[*]}")
echo "{\"data\": [$result]}"
