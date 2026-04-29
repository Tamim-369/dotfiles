#!/bin/bash
# Prevent system sleep and wait 8 hours
systemd-inhibit --why="alarm" sleep 8h

# Loop "wake up" until user stops it
while true; do
    espeak -a 200 -s 180 "WAKE UP!"
    sleep 2
done

