#!/bin/bash
sudo docker run -d --rm \
  -v /var/lib/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /var/lib/nginx/html:/usr/share/nginx/html \
  -p 8080:80 \
  nginx:stable-alpine nginx-debug \
  -g 'daemon-off'
