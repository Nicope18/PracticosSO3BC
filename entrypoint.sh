#!/bin/bash

# Verifica si el archivo rules.v4 existe en la nueva ruta y aplica las reglas de iptables
if [ -f /home/nico18/ProyectoSO/rules.v4 ]; then
    iptables-restore < /home/nico18/ProyectoSO/rules.v4
fi

# Ejecuta el comando proporcionado al contenedor (por defecto CMD)
exec "$@"

