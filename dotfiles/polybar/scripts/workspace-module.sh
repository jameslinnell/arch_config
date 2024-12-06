#!/bin/bash

# Define icons and colors for each workspace
declare -A workspace_icons
declare -A workspace_colors

# Define workspace icons and colors
workspace_icons=( 
    [1]="" 
    [2]=""
    [3]=""
    [4]=""
    [5]=""
    [6]=""
    [7]=""
    [8]=""
    [9]=""
    [10]=""
)

workspace_colors=( 
    [1]="#dc8a78"
    [2]="#ea76cb"
    [3]="#bcc0cc"
    [4]="#df8e1d"
    [5]="#40a02b"
    [6]="#d20f39"
    [7]="#a6e3a1"
    [8]="#F9E2AF"
    [9]="#f5bde6"
    [10]="#94e2d5"
)

unfocused_color="#585b70"

# Get all activated workspace numbers
all_workspaces=$(i3-msg -t get_workspaces | jq '.[] | .num')

# echo "$all_workspaces"

# Get the focused workspace number
focused_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true) | .num')

# echo "$focused_workspace"
# Initialize the workspaces string
workspaces=""

# Convert all_workspaces into an array (splitting by newline)
IFS=$'\n' read -r -d '' -a workspace_array <<< "$all_workspaces"

# echo "$workspace_array"

# Output the workspaces with their icons and colors
for workspace in "${workspace_array[@]}"; do
    icon=${workspace_icons[$workspace]}
    
    # If the workspace is focused, apply the focused color
    if [ "$workspace" -eq "$focused_workspace" ]; then
        color=${workspace_colors[$workspace]}
        workspaces="$workspaces  %{F$color}$icon%{F-}"  # Focused workspace
    else
        workspaces="$workspaces  %{F$unfocused_color}$icon%{F-}"  # Unfocused workspace
    fi
done

# Output all workspaces after the loop
echo "$workspaces"
