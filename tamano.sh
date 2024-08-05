#!/bin/bash

if [ -f "$1" ]; then
    size=$(du -sh "$1" | cut -f1)
    echo "El tamaño del archivo $1 es $size."
elif [ -d "$1" ]; then
    size=$(du -sh "$1" | cut -f1)
    echo "El tamaño del directorio $1 es $size."
else
    echo "$1 no existe."
fi
