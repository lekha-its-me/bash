#!/bin/bash
BACKUPS_ROOT=backups
RESTORES_ROOT=./restores/

if [ -d $BACKUPS_ROOT/$1 ]; 
then
	echo "Path exist..."
	cp backups/$1/dump.sql.gz restores/
	cp backups/$1/uploads.zip restores/
	gunzip restores/dump.sql.gz
	unzip restores/uploads.zip -d restores/
	rm restores/uploads.zip

	echo "Backup for $1 restored"
   
else
	echo "Backup for $1 not exist"
fi
