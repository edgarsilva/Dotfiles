#!/usr/bin/env bash
set -euo pipefail

PANEL_URL="http://homeassistant.local:8123"
PROFILE_DIR="~/.config/chromium-sensor-panel"
VIDEO_ID="AKfsikEXZHM"

hyprctl dispatch exec "chromium \
    --class=chromium-sensor-panel \
    --user-data-dir=\"~/.config/chromium-sensor-panel\" \
    --kiosk \
    --noerrdialogs \
    --disable-extensions \
    --disable-infobars \
    --disable-session-crashed-bubble \
    --disable-translate \
    --disable-features=TranslateUI \
    --disable-sync \
    \"http://localhost:9070\"
"
