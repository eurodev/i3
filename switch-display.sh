#!/bin/bash
#
# Set VGA monitor to the left of the laptop and primary.

# Private variables
XRANDR=$(which xrandr)
GREP=$(which grep)
WC=$(which wc)

function check() {

    if [ -z "${XRANDR}" ]
    then
        echo -e "xrandr is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi

    if [ -z "${GREP}" ]
    then
        echo -e "grep is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi

    if [ -z "${WC}" ]
    then
        echo -e "wc is not installed or in your path. Please, consider to install it in order to use this script"
        echo
        exit 2
    fi
}

function switch() {

    NUM_DISPLAYS=$(${XRANDR} | ${GREP} " connected " | ${WC} -l)

    if [ $NUM_DISPLAYS -eq 2 ]
    then
        #${XRANDR} --output LVDS1 --auto
        #${XRANDR} --output VGA1 --off
        #${XRANDR} --output VGA1 --left-of LVDS1 --auto
        #${XRANDR} --output VGA1 --primary
        #${XRANDR} --output eDP1 --auto
        #${XRANDR} --output eDP1 --scale 2x2
        #${XRANDR} --output DP1 --off
        #${XRANDR} --output DP1 --left-of eDP1 --auto
        #${XRANDR} --output DP1 --primary
        ${XRANDR} --output HDMI-1 --primary
        #${XRANDR} --output eDP-1 --off
        ${XRANDR} --output eDP-1 --below HDMI-1
        ${XRANDR} --output eDP-1 --scale 0.8x0.8
    else
        ${XRANDR} --output eDP-1 --scale 0.8x0.8
    fi
}

check
switch
