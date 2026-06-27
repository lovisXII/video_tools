#! /bin/bash

for sb in 32768 98304 163840 229376 294912 819200 884736 1605632 2654208 \
      4096000 7962624 11239424 20480000 23887872 71663616 78675968 \
      102400000 214990848 512000000 550731776 644972544 1934917632; do
 if sudo mount -t ext4 -o ro,noload,sb=$sb /dev/vda /mnt 2>/dev/null; then
  echo "=== SB $sb: MOUNTED ==="
  ls -1 /mnt | head -n 50
  sudo umount /mnt
 else
  echo "SB $sb: failed to mount"
 fi
done
