#!/bin/bash

# Fetch the battery status using upower
BATTERY=$(upower -e | grep battery)
STATUS=$(upower -i $BATTERY | grep state | awk '{print $2}')
PERCENTAGE=$(upower -i $BATTERY | grep percentage | awk '{print $2}')

# Display icons based on status
if [ "$STATUS" == "charging" ]; then
    ICON=""
elif [ "$STATUS" == "discharging" ]; then
    ICON=""
elif [ "$STATUS" == "fully-charged" ]; then
    ICON=""
else
    ICON=""
fi

echo "$ICON $PERCENTAGE"
