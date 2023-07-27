#!/bin/bash

# Función para convertir fecha y hora a segundos desde el epoch
date_to_seconds() {
    local date_string=$1
    local date_format="%d/%m/%Y-%H:%M:%S"
    date -u -d "$date_string" +"%s" 2>/dev/null
}

# Pedir fecha inicial
read -p "Ingresa la fecha inicial (dd/mm/yyyy-HH:MM:SS): " start_date

# Pedir fecha final
read -p "Ingresa la fecha final (dd/mm/yyyy-HH:MM:SS): " end_date

# Convertir fechas a segundos
start_seconds=$(date_to_seconds "$start_date")
end_seconds=$(date_to_seconds "$end_date")

# Calcular la diferencia en segundos
time_diff=$((end_seconds - start_seconds))

# Calcular meses, días y horas
months=$((time_diff / 60 / 60 / 24 / 30))
days=$((time_diff / 60 / 60 / 24))
hours=$((time_diff / 60 / 60 % 24))

# Mostrar el resultado
echo "El lapso de tiempo entre las fechas es de:"
echo "Meses: $months"
echo "Días: $days"
echo "Horas: $hours"
