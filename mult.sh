#!/bin/bash

# Función para multiplicar dos polinomios
multiply_polynomials() {
    local result=""
    for expr in "$@"; do
        result=$(echo "$result * ($expr)" | bc -l)
    done
    echo "$result"
}

# Lectura de las expresiones de usuario
read -p "Introducir expresiones (separadas por espacios): " expressions
expression_array=($expressions)

# Llamada a la función para multiplicar los polinomios
result=$(multiply_polynomials "${expression_array[@]}")

echo "Resultado de la multiplicación de polinomios = $result"
