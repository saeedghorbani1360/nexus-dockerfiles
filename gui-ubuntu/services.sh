#!/bin/bash

#systemctl start xrdp

/usr/sbin/xrdp-sesman
/usr/sbin/xrdp -n

vncserver :1 -geometry 1280x800 -depth 24 && tail -F ~/.vnc/*.log
