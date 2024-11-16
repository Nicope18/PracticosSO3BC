# Usa Ubuntu 22.04 como imagen base
FROM ubuntu:22.04

# Actualiza e instala iptables e iproute2
RUN apt-get update && \
    apt-get install -y iptables iproute2

# Crea el directorio de configuración de iptables
RUN mkdir -p /etc/iptables

# Copia el script de entrada
COPY entrypoint.sh /entrypoint.sh

# Copia el archivo rules.v4 a la ruta especificada
COPY ./rules.v4 /home/nico18/ProyectoSO/rules.v4

# Configura entrypoint.sh como punto de entrada del contenedor
ENTRYPOINT ["/entrypoint.sh"]

# Instalación de rsync y cron para backups
RUN apt-get update && \
    apt-get install -y rsync cron && \
    apt-get clean

# Crea un directorio para los backups
RUN mkdir -p /backup

# Copia el archivo crontab con las tareas de rsync en el contenedor
COPY crontab /etc/cron.d/rsync-backup

# Configura los permisos del crontab y lo carga en el servicio cron
RUN chmod 0644 /etc/cron.d/rsync-backup && \
    crontab /etc/cron.d/rsync-backup

# Mantiene el contenedor en ejecución
CMD ["cron", "-f", "sleep", "infinity"]


