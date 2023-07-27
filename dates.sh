#!/bin/bash

# Función para convertir fecha y hora a segundos desde el epoch
date_to_seconds() {
    local date_string=$1
    date -u -d "$date_string" +"%s" 2>/dev/null
}

# Función para obtener meses, días y horas a partir de la diferencia en segundos
obtener_meses_dias_horas() {
    local time_diff=$1
    local meses=$((time_diff / (30 * 24 * 60 * 60)))
    local dias=$((time_diff / (24 * 60 * 60)))
    local horas=$((time_diff / (60 * 60)))
    echo "$meses $dias $horas"
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

# Obtener meses, días y horas de la diferencia
meses_dias_horas=$(obtener_meses_dias_horas "$time_diff")
read meses dias horas <<< "$meses_dias_horas"

# Mostrar el resultado
echo "El lapso de tiempo entre las fechas es de:"
echo "Meses: $meses"
echo "Días: $dias"
echo "Horas: $horas"
