#!/bin/bash

mkdir -p /tmp/fstab

# backup fstab
cp /etc/fstab /tmp/fstab/fstab_$(date +%Y%m%d_%H%M%S).bk

/usr/sbin/blkid > /tmp/fstab/fstab_uuid

# remote \" in fstab_uuid
sed -i 's/\"//g' /tmp/fstab/fstab_uuid
sed -i 's/\://g' /tmp/fstab/fstab_uuid

while read line
do
  line_array=($line)
  symbol=${line_array[0]}
  uuid=${line_array[1]}
  sed -i "s?${symbol}?${uuid}?g" /etc/fstab
done < /tmp/fstab/fstab_uuid

echo "-----------------------------------------------"
echo The backup files are in the /tmp/fstab/ directory
echo "-----------------------------------------------"
echo e.g.: /tmp/fstab/fstab_20200414_113449.bk
echo
echo "-----------------------------------------------"
echo The new fstab is as follows:
echo "-----------------------------------------------"

cat /etc/fstab
