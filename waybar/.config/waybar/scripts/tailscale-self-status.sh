#!/usr/bin/env bash
set -euo pipefail

tailscale status --json 2>/dev/null | jq '.Self'
