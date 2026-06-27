#! /bin/bash
#
sudo systemctl stop jellyfin
TIMESTAMP=$(date +%Y%m%d)
BACKUP_DIR=~/hdd_8to/jellyfin_backups

mkdir -p ${BACKUP_DIR}/jellyfin.${TIMESTAMP} 
sudo chown jellyfin ${BACKUP_DIR}/
sudo chgrp jellyfin ${BACKUP_DIR}/
sudo chmod -R ug+wrx ${BACKUP_DIR}
sudo chmod -R o-wrx ${BACKUP_DIR}

mkdir -p ${BACKUP_DIR}/jellyfin.${TIMESTAMP}/data 
mkdir -p ${BACKUP_DIR}/jellyfin.${TIMESTAMP}/config

#sudo lrztar -o ${BACKUP_DIR}/jellyfin.${TIMESTAMP}.data.tar.gz -L 2 -p $(nproc) /var/lib/jellyfin/
# sudo tar czf ${BACKUP_DIR}/jellyfin.${TIMESTAMP}.config.tar.gz /etc/jellyfin
sudo rsync -ah --info=progress2 /var/lib/jellyfin ${BACKUP_DIR}/jellyfin.${TIMESTAMP}/data
sudo rsync -ah --info=progress2 /etc/jellyfin ${BACKUP_DIR}/jellyfin.${TIMESTAMP}/config
