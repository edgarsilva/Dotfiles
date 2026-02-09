#!/usr/bin/env bash
set -euo pipefail

status="$(tailscale status --json 2>/dev/null | jq -r '.BackendState')"

if [[ "$status" == "Running" ]]; then
    # Tailscale is connected → bring it down
    tailscale down
else
    # Tailscale is stopped/disconnected → bring it up
    tailscale up
fi
