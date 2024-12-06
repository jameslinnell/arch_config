#!/bin/bash

if [ "$1" == "toggle" ]; then
  # Toggle the visibility of the dropdown module
  pkill -USR1 -f "polybar --reload crypto-dropdown"
else
  # Fetch and display multiple cryptocurrencies
  curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ripple,stellar,cardano,algorand,casper,crypto,ethereum,solana&vs_currencies=usd" | jq -r '
    . as $data |
    "BTC: $" + ($data.bitcoin.usd|tostring) + " | XRP: $" + ($data.ripple.usd|tostring) + " | XLM: $" + ($data.stellar.usd|tostring) + " | ADA: $" + ($data.cardano.usd|tostring)
  '
fi

