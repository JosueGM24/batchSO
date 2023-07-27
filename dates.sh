#!/bin/bash

# Función para convertir una fecha a segundos desde el epoch (1970-01-01 00:00:00 UTC)
function fecha_a_segundos() {
    date -d "$1" +%s
}

# Función para calcular la diferencia entre dos fechas en segundos
function calcular_diferencia() {
    fecha_inicial=$1
    fecha_final=$2

    segundos_inicial=$(fecha_a_segundos "$fecha_inicial")
    segundos_final=$(fecha_a_segundos "$fecha_final")

    echo $((segundos_final - segundos_inicial))
}

# Función para convertir segundos a días, horas y meses
function segundos_a_dias_horas_meses() {
    segundos=$1

    meses=$((segundos / (30*24*60*60)))
    segundos=$((segundos % (30*24*60*60)))

    dias=$((segundos / (24*60*60)))
    segundos=$((segundos % (24*60*60)))

    horas=$((segundos / (60*60)))
    segundos=$((segundos % (60*60)))

    echo "Días: $dias"
    echo "Horas: $horas"
    echo "Meses: $meses"
}

# Pedir fechas al usuario
read -p "Ingrese la fecha inicial (formato dd/mm/yyyy-hh:mm:ss): " fecha_inicial
read -p "Ingrese la fecha final (formato dd/mm/yyyy-hh:mm:ss): " fecha_final

# Calcular diferencia en segundos
diferencia_segundos=$(calcular_diferencia "$fecha_inicial" "$fecha_final")

# Convertir segundos a días, horas y meses y mostrar el resultado
segundos_a_dias_horas_meses $diferencia_segundos
