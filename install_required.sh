#!/usr/bin/env bash

set -e

FILE="packages.txt"

if [ ! -f "$FILE" ]; then
  echo "packages.txt not found"
  exit 1
fi

sudo apt update
sudo apt install -y $(grep -v "^$" "$FILE")
