#!/usr/bin/env bash

read -p "Enter server and port: " SERVER PORT

timeout 2 bash -c "</dev/tcp/$SERVER/$PORT"

if [ "$?" -ne 0 ]; then
  echo "Connection to $SERVER on port $PORT failed"
  exit 1
else
  echo "Connection to $SERVER on port $PORT succeeded"
  exit 0
fi
