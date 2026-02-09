#!/usr/bin/env bash

# Get floating state (1 = floating, 0 = tiled)
IS_FLOATING=$(hyprctl -j activewindow | jq '.floating')

# If floating → snap back to tiling, no resize/center required
if [ "$IS_FLOATING" = "true" ]; then
  hyprctl dispatch togglefloating
  exit 0
fi

# If tiled → float + resize + center
hyprctl dispatch togglefloating
hyprctl dispatch resizeactive exact 1780 1100
hyprctl dispatch centerwindow
