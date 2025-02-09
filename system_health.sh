#!/bin/bash

echo "📊 System Health Report - $(date)"
echo "--------------------------------------"

# CPU Load
echo "🔥 CPU Load: $(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')"

# Memory Usage
echo "💾 Memory Usage:"
free -h

# Disk Space
echo "🖴 Disk Usage:"
df -h | grep "/dev/"

# Top 5 Memory-Consuming Processes
echo "🔝 Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6

echo "--------------------------------------"

