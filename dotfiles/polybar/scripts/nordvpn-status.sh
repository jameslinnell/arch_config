#!/bin/bash

status=$(nordvpn status | grep 'Status' | awk '{print $2}')

if [ "$status" = "Connected" ]; then
    country=$(nordvpn status | grep 'Country' | awk -F': ' '{print $2}')
    # Abbreviation logic
    case "$country" in
        "United Kingdom") country="UK" ;;
        "United States") country="USA" ;;
        "New Zealand") country="NZ" ;;
        "South Korea") country="KR" ;;
        *) 
            # If the country is a single word, abbreviate to the first 3 letters
            if [[ "$country" =~ ^[A-Za-z]+$ ]]; then
                country=$(echo "$country" | cut -c 1-3)
            fi
            ;;
    esac

    echo "$country"
else
    echo "Disconnected"
fi
