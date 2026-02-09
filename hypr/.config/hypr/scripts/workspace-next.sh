#!/usr/bin/env bash

# Upper bounds
MAX_DP1=7
MAX_DP2=14

# Get active workspace ID and monitor
ws=$(hyprctl activeworkspace -j)
current_id=$(echo "$ws" | jq -r '.id')
monitor=$(echo "$ws" | jq -r '.monitor')

# Select appropriate max
if [ "$monitor" = "DP-2" ]; then
    max_id="$MAX_DP2"
else
    max_id="$MAX_DP1"
fi

# Stop if we're at or above the upper limit
if [ "$current_id" -ge "$max_id" ]; then
    exit 0
fi

# Increment
hyprctl dispatch workspace "$((current_id + 1))"
