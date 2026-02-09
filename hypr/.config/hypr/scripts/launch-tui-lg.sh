WIDTH=120
HEIGHT=40

exec setsid uwsm-app -- xdg-terminal-exec --app-id=org.omarchy.$(basename $1) -e "$1" "${@:2}"

exec setsid uwsm-app -- \
  xdg-terminal-exec \
    --app-id=org.omarchy.$(basename $1) \
    -e "$1" "${@:2}" \
    --override initial_window_width=$WIDTH \
    --override initial_window_height=$HEIGHT
