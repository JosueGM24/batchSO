#!/bin/bash

# Función para convertir la fecha y hora al formato "segundos desde el 01/01/1970"
get_timestamp() {
    date -d "$1" +%s
}

# Ingresar la fecha y hora inicial
read -p "Ingresa la fecha y hora inicial (formato: YYYY-MM-DD HH:MM:SS): " start_date

# Obtener la fecha y hora actual
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Convertir las fechas al formato "segundos desde el 01/01/1970"
start_timestamp=$(get_timestamp "$start_date")
current_timestamp=$(get_timestamp "$current_date")

# Calcular la diferencia en segundos
difference=$((current_timestamp - start_timestamp))

# Calcular años, meses y días
years=$((difference / 31536000))
months=$((difference % 31536000 / 2628000))
days=$((difference % 2628000 / 86400))

# Calcular horas, minutos y segundos
hours=$((difference % 86400 / 3600))
minutes=$((difference % 3600 / 60))
seconds=$((difference % 60))

# Mostrar los resultados
echo "Han pasado $years años, $months meses, $days días, $hours horas, $minutes minutos y $seconds segundos."