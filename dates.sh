#!/bin/bash

# Función para convertir fecha y hora a formato 'yyyy-mm-dd HH:MM:SS' (necesario para el cálculo)
convert_to_timestamp() {
    local date_string=$1
    date -d "$date_string" +"%Y-%m-%d %H:%M:%S"
}

# Función para obtener la diferencia entre dos fechas en segundos
get_time_diff_in_seconds() {
    local start_date=$1
    local end_date=$2
    local start_timestamp=$(convert_to_timestamp "$start_date")
    local end_timestamp=$(convert_to_timestamp "$end_date")

    # Usamos %s para obtener la representación en segundos desde epoch
    echo $(( $(date -d "$end_timestamp" +%s) - $(date -d "$start_timestamp" +%s) ))
}

# Pedir fecha inicial
read -p "Ingresa la fecha inicial (dd/mm/yyyy-HH:MM:SS): " start_date

# Pedir fecha final
read -p "Ingresa la fecha final (dd/mm/yyyy-HH:MM:SS): " end_date

# Obtener la diferencia en segundos
time_diff_in_seconds=$(get_time_diff_in_seconds "$start_date" "$end_date")

# Calcular meses, días y horas
months=$((time_diff_in_seconds / (30*24*60*60)))
days=$((time_diff_in_seconds / (24*60*60)))
hours=$((time_diff_in_seconds / (60*60)))

# Mostrar el resultado
echo "El lapso de tiempo entre las fechas es de:"
echo "Meses: $months"
echo "Días: $days"
echo "Horas: $hours"
