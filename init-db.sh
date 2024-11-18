#!/bin/bash

# Verifica si el servicio de MySQL está activo antes de continuar
until mysql -u root -p$nico1802 -e "SHOW DATABASES;" > /dev/null 2>&1; do
    echo "Esperando a que MySQL se inicie..."
    sleep 2
done

echo "MySQL iniciado. Ejecutando script SQL..."

# Ejecuta el archivo SQL para inicializar la base de datos
mysql -u root -p$nico1802 mafanike < /docker-entrypoint-initdb.d/init.sql

