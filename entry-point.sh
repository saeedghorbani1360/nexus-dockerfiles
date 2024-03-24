#!/bin/bash

/opt/nexus/bin/nexus start
while [ ! -f /opt/sonatype-work/nexus3/log/nexus.log ]; 
do 
	sleep 2; 
done; 
tail -f /opt/sonatype-work/nexus3/log/nexus.log
