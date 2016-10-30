#!/bin/bash

# Add ip and container id to hosts file
echo "$1 $2 $2.localdomain" >> /etc/hosts


# Restart sendmail service
/etc/init.d/sendmail start