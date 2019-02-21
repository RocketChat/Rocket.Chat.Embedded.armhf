#!/bin/sh
export LC_ALL=C
printf "Starting container at "; date;
# /usr/sbin/sshd -D &
if [[ ! -d "/data/db" ]]; then
	mkdir -p /data/db
fi
/usr/bin/mongod --dbpath /data/db --journal --storageEngine=mmapv1
