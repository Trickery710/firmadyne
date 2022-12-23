#!/bin/bash
set -e
set -x

export PGPASSWORD=firmadyne
export USER=firmadyne

#docker run -itd -e POSTGRES_USER=firmadyne -e POSTGRES_PASSWORD=firmadyne -p 5432:5432 -v /data:/var/lib/postgresql/data --name postgresql postgres
# Start database
#echo "firmadyne" | sudo -S service postgresql start
#echo "Waiting for DB to start..."
sleep 5

exec "$@"
