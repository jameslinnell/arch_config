#!/bin/bash

# Get the focused workspace number
focused_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

# Define the colors for each workspace
case $focused_workspace in
    0) echo "#FF0000" ;;   # Red for workspace 0
    1) echo "#00FF00" ;;   # Green for workspace 1
    2) echo "#0000FF" ;;   # Blue for workspace 2
    3) echo "#FFFF00" ;;   # Yellow for workspace 3
    4) echo "#FF00FF" ;;   # Magenta for workspace 4
    5) echo "#00FFFF" ;;   # Cyan for workspace 5
    6) echo "#FF5733" ;;   # Custom color for workspace 6
    7) echo "#33FF57" ;;   # Custom color for workspace 7
    8) echo "#5733FF" ;;   # Custom color for workspace 8
    9) echo "#C70039" ;;   # Custom color for workspace 9
    *) echo "#FFFFFF" ;;   # Default color for other workspaces
esac
