#!/bin/bash

#systemctl start xrdp

vncserver :1 -geometry 1280x800 -depth 24

/usr/sbin/xrdp-sesman
/usr/sbin/xrdp -n

tail -F ~/.vnc/*.log
