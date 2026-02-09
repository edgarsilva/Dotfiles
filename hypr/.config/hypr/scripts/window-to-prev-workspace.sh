#!/usr/bin/env bash

# Lower workspace bound for DP-1
MIN_DP1=1

# Lower workspace bound for DP-2
MIN_DP2=8

# Get active workspace info
ws=$(hyprctl activeworkspace -j)
current_id=$(echo "$ws" | jq -r '.id')
monitor=$(echo "$ws" | jq -r '.monitor')

# Select appropriate lower bound
if [ "$monitor" = "DP-2" ]; then
    min_id="$MIN_DP2"
else
    min_id="$MIN_DP1"
fi

# Stop if we're at or below the lower limit
if [ "$current_id" -le "$min_id" ]; then
    exit 0
fi

# Move window to previous workspace
hyprctl dispatch movetoworkspace "$((current_id - 1))"
