#!/bin/bash

if [ -z "$1" ]; then
  echo "Debe proporcionar un parámetro."
  exit 1
fi

if [ -f "$1" ]; then
  echo "$1 es un archivo."
elif [ -d "$1" ]; then
  echo "$1 es un directorio."
else
  echo "$1 no existe."
fi
