#!/bin/bash

# If OCTOSCREEN_RESOLUTION has not been set, then default it to 800x400
if [[ -z "$OCTOSCREEN_RESOLUTION" ]]; then
  OCTOSCREEN_RESOLUTION=800x400
fi

# If OCTOPRINT_APIKEY has not been set, then enter a loop wherein xinit does not run until it is set
if [[ -z "$OCTOPRINT_APIKEY" ]]; then
while true
do
  echo "OCTOPRINT_APIKEY has not been set in service variables. Octoscreen will not run until this is set."
  sleep 120
done
fi

/usr/bin/xinit /usr/bin/OctoScreen -- -nolisten tcp -nocursor

