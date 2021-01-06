#!/bin/sh
set -e

args=""

if [ "$1" = "lightspeed-webrtc" ]; then
    args="--addr 0.0.0.0"

    if [ -n $LIGHTSPEED_WEBRTC_PUBLIC_IP ]; then
        args="$args --ip=$LIGHTSPEED_WEBRTC_PUBLIC_IP"
    fi
fi


exec $@ $args
