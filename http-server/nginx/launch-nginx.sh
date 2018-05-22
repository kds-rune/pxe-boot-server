#!/bin/bash
sudo docker run -d --rm \
  -p 8080:80 \
  -v "$PWD"/html:/usr/share/nginx/html \
  nginx:stable-alpine
