#!/bin/bash

# Función para calcular la diferencia entre dos fechas en días, horas y meses
function calcular_diferencia() {
    fecha_inicial=$1
    fecha_final=$2

    # Convertir fechas a timestamp (segundos desde el epoch)
    timestamp_inicial=$(date -d "$fecha_inicial" +%s)
    timestamp_final=$(date -d "$fecha_final" +%s)

    # Calcular la diferencia en segundos
    diferencia_segundos=$((timestamp_final - timestamp_inicial))

    # Calcular meses y días
    meses=$((diferencia_segundos / (30 * 24 * 60 * 60))
    dias=$((diferencia_segundos / (24 * 60 * 60))

    # Calcular horas
    segundos_restantes=$((diferencia_segundos % (24 * 60 * 60))
    horas=$((segundos_restantes / (60 * 60))

    echo "Días: $dias"
    echo "Horas: $horas"
    echo "Meses: $meses"
}

# Pedir fechas al usuario
read -p "Ingrese la fecha inicial (formato dd/mm/yyyy-hh:mm:ss): " fecha_inicial
read -p "Ingrese la fecha final (formato dd/mm/yyyy-hh:mm:ss): " fecha_final

# Calcular diferencia y mostrar el resultado
calcular_diferencia "$fecha_inicial" "$fecha_final"
