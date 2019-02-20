#!/bin/bash

set -e
if [ $1=~^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ];
then
	if [ -d $BACKUPS_ROOT/$1 ]; 
	then
		echo "Path exist..."
		cp backups/$1/dump.sql.gz backend/
		cp backups/$1/uploads.zip backend/web/uploads/

		gunzip backend/dump.sql.gz
		unzip backend/web/uploads/uploads.zip -d backend/web/uploads/
		rm restores/uploads.zip

		echo "Backup for $1 restored"
   
	else
		echo "Backup for $1 not exist"
	fi
else
	echo "Wrong date format "$1
fi
