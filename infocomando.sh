#!/bin/bash

if [ -z "$1" ]; then
  echo "Debe proporcionar un comando."
  exit 1
fi

man "$1"
