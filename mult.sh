#!/bin/bash

# Función para multiplicar dos polinomios en formato (x+a)
multiply_polynomials() {
    local result=""

    # Iterar a través de los factores y construir el polinomio resultante
    for factor in "$@"; do
        if [[ $factor =~ ^\([[:space:]]*x[[:space:]]*\+[[:space:]]*([0-9-]+)[[:space:]]*\)$ ]]; then
            coefficient="${BASH_REMATCH[1]}"
            if [ "$coefficient" -gt 0 ]; then
                term="+${coefficient}x"
            elif [ "$coefficient" -lt 0 ]; then
                term="${coefficient}x"
            fi
        fi
        result="${result}${term}"
    done

    # Eliminar el primer signo de suma si existe y ajustar el formato
    result="${result#?}"
    result="${result//x^1/x}"
    result="${result//x+/+x}"
    echo "$result"
}

# Lectura de las expresiones de usuario
read -p "Introducir expresiones (separadas por espacios): " expressions
expression_array=($expressions)

# Llamada a la función para multiplicar los polinomios
result=$(multiply_polynomials "${expression_array[@]}")

echo "Resultado de la multiplicación de polinomios = $result"
