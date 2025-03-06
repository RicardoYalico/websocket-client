#!/bin/bash

# Iniciar el servidor WebSocket en segundo plano
php /var/www/html/server.php

# Iniciar el servidor PHP en segundo plano (escuchar en 0.0.0.0 para acceso externo)
# cd /var/www/html/public && php -S 0.0.0.0:8000 &

# Esperar a que ambos procesos se mantengan corriendo
wait
