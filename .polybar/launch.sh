#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.polybar/config --reload example &
  done
else
  polybar --reload example &
fi

#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar -c ~/.polybar/config example >>/tmp/polybar1.log 2>&1 &
##polybar bar2 >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
