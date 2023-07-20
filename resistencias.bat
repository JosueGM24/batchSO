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

# Función para obtener el valor multiplicador en ohmios
get_resistor_multiplier() {
    case $1 in
        ne|negro) echo 1 ;;
        ma|marron) echo 10 ;;
        ro|rojo) echo 100 ;;
        na|naranja) echo 1000 ;;
        am|amarillo) echo 10000 ;;
        ve|verde) echo 100000 ;;
        az|azul) echo 1000000 ;;
        vi|violeta) echo 10000000 ;;
        gr|gris) echo 100000000 ;;
        bl|blanco) echo 1000000000 ;;
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

# Obtener el valor numérico de los dos primeros colores
valor_ohmios=""
for (( i = 0; i < 2; i++ )); do
    color=${colores_array[$i]}
    valor=$(get_resistor_value "$color")
    if [ $valor -eq -1 ]; then
        echo "Color inválido: $color"
        exit 1
    fi
    valor_ohmios="${valor_ohmios}${valor}"
done

# Obtener el valor multiplicador del tercer color
color=${colores_array[2]}
valor_multiplicador=$(get_resistor_multiplier "$color")
if [ $valor_multiplicador -eq -1 ]; then
    echo "Color multiplicador inválido: $color"
    exit 1
fi

# Calcular el valor en ohmios
valor_final=$(( valor_ohmios * valor_multiplicador ))

echo "El valor de la resistencia es: $valor_final ohms"
