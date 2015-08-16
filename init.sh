#!/bin/sh

cd /vault
CONTAINER_IP=`grep $HOSTNAME /etc/hosts | awk '{print $1}'` dockerize -template /vault/server.hcl.tpl:/vault/server.hcl echo -n

echo "server config:"
cat /vault/server.hcl

echo "vault $@"
exec vault $@

