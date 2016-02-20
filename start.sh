#!/bin/sh
/etc/init.d/redis-server start
exec rails s -b 0.0.0.0
