#!/bin/bash
#
# Fixes macOS appending random numbers to your hostname when switching
# between wifi and wired connections (e.g. "matts-mbp" becomes "matts-mbp-2847").
# Safe to run anytime — only prompts for sudo if the hostname needs fixing.

hostname=$(scutil --get LocalHostName)

# If hostname has a trailing hyphen + number, strip it
normal_hostname=$(echo "$hostname" | sed 's/-[0-9]*$//')

if [ "$normal_hostname" != "$hostname" ]; then
  echo "Fixing hostname: $hostname → $normal_hostname"
  sudo scutil --set LocalHostName "$normal_hostname"
  sudo scutil --set ComputerName "$normal_hostname"
else
  echo "Hostname is clean: $hostname"
fi
