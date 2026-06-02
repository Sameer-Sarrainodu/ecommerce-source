#!/bin/bash

if [ -f /tmp/mysql_root_password.txt ]; then
    PASSWORD=$(cat /tmp/mysql_root_password.txt)
    export MYSQL_ROOT_PASSWORD=$PASSWORD
    rm -f /tmp/mysql_root_password.txt
fi

exec /entrypoint.sh mysqld