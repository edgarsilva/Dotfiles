#!/usr/bin/env bash

# Check if tailscaled service is running
if ! systemctl is-active --quiet tailscaled; then
  echo -n "stopped"
  exit 0
fi

# Check if Tailscale is connected
status=$(tailscale status --json 2>/dev/null)

if [[ $? -ne 0 ]]; then
  echo -n "error"
  exit 1
fi

# Connected?
connected=$(echo "$status" | jq -r '.Self.Online')

status="offline"
if [[ "$connected" == "true" ]]; then
  status="online"
fi

printf '{"text":"%s","class":"%s","alt":"%s"}' "$status" "$status" "$status"
