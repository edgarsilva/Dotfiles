#!/usr/bin/env bash

set -euo pipefail

pkill -x mako || true

exec uwsm-app -- swaync
