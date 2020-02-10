#!/bin/bash

# If OCTOPRINT_APIKEY has not been set, then enter a loop wherein xinit does not run until it is set

if [[ -z "$OCTOPRINT_APIKEY" ]]; then
while true
do
  echo "OCTOPRINT_APIKEY has not been set in service variables. Octodash will not run until this is set."
  sleep 120
done
fi

# Now that we have the user's OCTOPRINT_APIKEY from the Balena Dashboard, we can run this through jq, a sed-like JSON Processor
# to replace the key value of .config.octoprint.accessToken of OctoDash's config file with that specified by the environment variable.

FILE="$HOME/.config/octodash/config.json"
TMP=$(mktemp)
jq ".config.octoprint.accessToken |= \"$OCTOPRINT_APIKEY\"" < $FILE > $TMP && mv $TMP $FILE

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
## BASED ON:
## https://github.com/balena-io/resin-electronjs/blob/master/app/start.sh

umount /dev/shm && mount -t tmpfs shm /dev/shm

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X instance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs
## BASED ON:
## https://github.com/balena-io/resin-electronjs/blob/master/app/start.sh

rm /tmp/.X0-lock &>/dev/null || true
startx /usr/src/app/OctoDash/node_modules/electron/dist/electron /usr/src/app/OctoDash --enable-logging --no-sandbox

