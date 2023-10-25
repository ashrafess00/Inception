#!/bin/sh

# Change permissions on the /etc/redis directory
chmod -R 777 /etc/redis

sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

# Add maxmemory and maxmemory-policy settings to the Redis configuration
echo "maxmemory 256mb" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

# Start Redis with the modified configuration
redis-server /etc/redis/redis.conf