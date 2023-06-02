#!/bin/zsh

shorten_eventbrite_url() {
  local url="$1"
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
}

# Check if a URL argument is provided
if [[ -z $1 ]]; then
  echo "Please provide a URL argument."
  exit 1
fi

shortened_url=$(shorten_eventbrite_url "$1")

if [[ $? -eq 0 ]]; then
  echo "Shortened URL: $shortened_url"
fi

# Usage example: ./Shell.zsh "https://www.eventbrite.com/e/build-an-openai-art-generator-gallery-javascript-workshop-tickets-596821207297?aff=hackbuddy"
# Expected output: https://eventbrite.com/e/596821207297
