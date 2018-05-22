#!/bin/bash
sudo docker run -d --rm \
  -p 8080:80 \
  -v "$PWD"/data:/usr/local/apache2/htdocs/ \
  httpd:alpine
