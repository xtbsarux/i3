#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/hack"

# Terminate already running bar instances
killall -q polybar

# HWMON Temp
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
        export HWMON_PATH="$i"
    fi
done

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar on single monitor
#polybar -q top -c "$DIR"/config.ini &
#polybar -q bottom -c "$DIR"/config.ini &

#Launch the bar on multiple monitors
if type "xrandr"; then
  polybar -q bottom -c "$DIR"/config.ini & #Launch bottom bar only on primary monitor
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -q top -c "$DIR"/config.ini &
   #MONITOR=$m polybar -q bottom -c "$DIR"/config.ini &
  done
else
  polybar -q top -c "$DIR"/config.ini &
  polybar -q bottom -c "$DIR"/config.ini &
fi
