#!/bin/bash

NFS_IP=192.168.60.55

apt install -y nfs-common
mkdir /home/nfs_home
mount -t nfs $NFS_IP:/home/nfs_home/ /home/nfs_home
echo "$NFS_IP:/home/nfs_home /home/nfs_home nfs defaults 0 0" >> /etc/fstab

mount /home/nfs_home/
