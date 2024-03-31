#!/bin/bash

echo "Backup from running containers"

cons=`docker ps --format "{{.Names}}"`
date=`date +%Y-%m-%d_%H-%M-%S`

docker image prune --filter  until=72h
find . -name "backup_*.tar" -mmin +600 -exec rm -rf {} \;

for i in $cons
do
	echo "Container name : " $i
	newname="backup_${i}:${date}"
	docker commit ${i} ${newname} >> /dev/null 
	docker save ${newname} -o ${newname}.tar
done

