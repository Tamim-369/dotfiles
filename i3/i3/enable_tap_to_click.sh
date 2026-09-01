#!/bin/bash

# Find all touchpad device IDs
TOUCHPAD_IDS=$(xinput list | grep -i "SYNA30D2" | awk -F 'id=' '{print $2}' | awk '{print $1}')

if [ -z "$TOUCHPAD_IDS" ]; then
    echo "No touchpad found."
    exit 1
fi

# Loop through each ID and enable tap-to-click
for ID in $TOUCHPAD_IDS; do
    xinput set-prop "$ID" "libinput Tapping Enabled" 1 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Tap-to-click has been enabled for touchpad ID $ID."
    else
        echo "Failed to enable tap-to-click for touchpad ID $ID."
    fi
done
