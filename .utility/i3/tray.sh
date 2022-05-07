#!/bin/bash

pkill -f pasystray
pkill -f blueman-tray
pkill -f nm-applet

pasystray --notify=all & disown
blueman-tray & disown
nm-applet --indicator & disown
