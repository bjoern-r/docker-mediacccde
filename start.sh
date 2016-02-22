#!/bin/sh
#
## This is the docker entrypoint script
#
/etc/init.d/redis-server start
./bin/setup && rake db:migrate && rake db:fixtures:load
exec rails s -b 0.0.0.0
