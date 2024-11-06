#!/bin/bash

# Terminate already running bar instances
#
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
#
# Otherwise you can use the nuclear option:

# killall -q polybar
#
# # Launch polybar
# polybar example 2>&1 | tee -a /tmp/polybar.log & disown
#
# echo "Bars launched..."


for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done
