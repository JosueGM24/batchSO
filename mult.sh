#!/bin/bash

# Función para multiplicar dos polinomios
multiply_polynomials() {
    local result="1"
    for expr in "$@"; do
        result=$(echo "scale=10; $result * ($expr)" | bc)
    done
    echo "$result"
}

# Lectura de las expresiones de usuario
read -p "Introducir expresiones (separadas por espacios): " expressions
expression_array=($expressions)

# Llamada a la función para multiplicar los polinomios
result=$(multiply_polynomials "${expression_array[@]}")

echo "Resultado de la multiplicación de polinomios = $result"
