#!/usr/bin/env bash

# Is the special:scratchpad workspace currently shown on ANY monitor?
SCRATCH_VISIBLE=$(
  hyprctl -j monitors \
    | jq '[ .[]
            | select(.specialWorkspace.name == "special:scratchpad")
          ]
          | length'
)

if [[ "$SCRATCH_VISIBLE" -gt 0 ]]; then
  # Special workspace is toggled *on* (visible), even if it has no windows
  echo '{ "text": " scratchpad", "class": "active" }'
else
  # Special workspace is not currently shown anywhere
  echo '{ "text": " scratchpad" }'
fi
