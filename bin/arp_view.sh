#!/usr/bin/env bash

sudo arp -an | grep -v incom | awk '{print $2" "$4}' | tr -d '()'
