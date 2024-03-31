#!/bin/bash

echo "Backup from running containers"

cons=`docker ps --format "{{.Names}}"`
date=`date +%Y-%m-%d_%H-%M-%S`

docker images --filter "reference=backup_my*:*" --format '{{.ID}}:{{.CreatedAt}}' | while IFS= read -r line; do
    image_id=$(echo "$line" | cut -d':' -f1)
    created_at=$(echo "$line" | cut -d':' -f2)
    timestamp=$(date -d "$created_at" +%s)
    current_time=$(date +%s)
    age=$((current_time - timestamp))
    if [ "$age" -gt 10800 ]; then
	echo "${image_id} removed."    
        docker rmi  "$image_id"
    fi
done
find . -name "backup_*.tar" -mmin +600 -exec rm -rf {} \;

for i in $cons
do
	echo "Container name : " $i
	newname="backup_${i}:${date}"
	docker commit ${i} ${newname} >> /dev/null 
	docker save ${newname} -o ${newname}.tar
done

