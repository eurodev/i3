#!/bin/bash
#
# Set VGA monitor to the left of the laptop and primary.

xrandr --output LVDS1 --auto
xrandr --output VGA1 --off
xrandr --output VGA1 --left-of LVDS1 --auto
xrandr --output VGA1 --primary
