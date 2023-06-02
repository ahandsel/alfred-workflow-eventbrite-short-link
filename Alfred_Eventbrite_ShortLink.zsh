#!/bin/zsh
url="{query}"
local base_url="https://eventbrite.com/e/"

# Extracting the ID following "tickets-"
local id=$(echo "$url" | sed -n 's/.*tickets-\([0-9]\{12\}\).*/\1/p')

if [[ -n $id ]]; then
  local shorten_url="${base_url}${id}"
  echo -n "$shorten_url"
  return 0
else
  echo "Unable to shorten the URL." >&2
  return 1
fi
