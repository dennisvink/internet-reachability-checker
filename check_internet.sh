#!/bin/bash

#########################################################################
## This script sends a ping request to several well-known IP addresses ##
## of DNS providers. If none of them are reachable within 15 minutes   ##
## the script will reboot the server.                                  ##
##                                                                     ##
## Donated to the public domain by D.R. Vink (dennis <at> drvink.com)  ##
#########################################################################

## List of well-known DNS providers ##
hosts=(8.8.8.8 1.1.1.1 1.0.0.1 8.8.4.4 9.9.9.9 208.67.222.222)

# Timeout in minutes
timeout=15

while true; do
  # Loop through the list of hosts
  for host in "${hosts[@]}"; do
    # Ping the host
    ping -c 1 -W 10 $host > /dev/null 2>&1

    # Check if the ping was successful
    if [ $? -eq 0 ]; then
      # Host is reachable, set timeout back to 15, wait a minute and jump to the beginning of the loop
      echo "We are reachable at $host"
      timeout=15
      sleep 60
      continue 2
    else
      echo "We are unreachable at $host"
      ((timeout--))
      echo "Timeout at: $timeout"
      if [ $timeout -eq 0 ]; then
        # If the timeout has been reached, reboot the system
        echo "We timed out. Estamos fritos."
        reboot
      fi
      sleep 50
    fi
  done
done
