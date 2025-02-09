#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

echo "Checking Apache logs for 4xx and 5xx errors..."
sudo grep -E 'HTTP/1.[01]" (4[0-9]{2}|5[0-9]{2})' "$LOG_FILE" > errors.log

echo "Summary of errors:"
sudo awk '{print $9}' "$LOG_FILE" | grep -E '4[0-9]{2}|5[0-9]{2}' | sort | uniq -c

echo "Detailed errors saved in errors.log"
