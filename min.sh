#!/bin/bash

# Pedir la cantidad de números al usuario
read -p "Ingresa la cantidad de números: " cantidad_numeros

# Generar la cantidad de números aleatorios y guardarlos en un arreglo
numeros=()
for ((i=0; i<cantidad_numeros; i++)); do
  numeros[i]=$((RANDOM % 100))  # Generar números aleatorios entre 0 y 99
done

echo "Números generados aleatoriamente: ${numeros[@]}"

# Ordenar el arreglo de forma ascendente
sorted_numeros=($(printf '%s\n' "${numeros[@]}" | sort -n))

# Encontrar los dos números menores
menor1=${sorted_numeros[0]}
menor2=${sorted_numeros[1]}

echo "Los dos números menores son: $menor1 y $menor2"

# Encontrar todos los números iguales a los menores y realizar la suma
suma=0
for num in "${numeros[@]}"; do
  if [[ $num -eq $menor1 || $num -eq $menor2 ]]; then
    suma=$((suma + num))
  fi
done

echo "La suma de los números iguales a los menores es: $suma"
