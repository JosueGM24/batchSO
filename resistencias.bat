#!/bin/bash

# Función para obtener el valor en ohmios de un color
get_resistor_value() {
    case $1 in
        ne|negro) echo 0 ;;
        ma|marron) echo 1 ;;
        ro|rojo) echo 2 ;;
        na|naranja) echo 3 ;;
        am|amarillo) echo 4 ;;
        ve|verde) echo 5 ;;
        az|azul) echo 6 ;;
        vi|violeta) echo 7 ;;
        gr|gris) echo 8 ;;
        bl|blanco) echo 9 ;;
        *) echo -1 ;; # Valor inválido
    esac
}

# Obtener los colores ingresados
echo "Ingresa los colores de la resistencia (separados por comas): "
read colores

# Convertir la entrada a minúsculas y eliminar espacios
colores=$(echo "$colores" | tr '[:upper:]' '[:lower:]' | sed 's/ //g')

# Separar los colores por comas
IFS=',' read -ra colores_array <<< "$colores"

# Obtener el valor numérico de cada color y calcular el valor en ohmios
valor_ohmios=""
for color in "${colores_array[@]}"; do
    valor=$(get_resistor_value "$color")
    if [ $valor -eq -1 ]; then
        echo "Color inválido: $color"
        exit 1
    fi
    valor_ohmios="${valor_ohmios}${valor}"
done

# Calcular el valor en ohmios
valor_final=$(( valor_ohmios * 10**${#valor_ohmios} ))

echo "El valor de la resistencia es: $valor_final ohms"
