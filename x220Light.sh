#!/bin/bash

echo "Turn the ThinkLight on with '2'"

if [ "$1" != 2 ]; then
    echo 0 > /sys/class/leds/tpacpi\:\:thinklight/brightness
    echo 'its off'
else 
    
        echo 255 > /sys/class/leds/tpacpi\:\:thinklight/brightness
      echo 'its on'
    fi
    
