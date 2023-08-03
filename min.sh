#!/bin/bash

# Pedir la cantidad de números al usuario
read -p "Ingresa la cantidad de números: " cantidad_numeros

# Generar la cantidad de números aleatorios y guardarlos en un arreglo
numeros=()
for ((i=0; i<cantidad_numeros; i++)); do
  numeros[i]=$((RANDOM % 100))  # Generar números aleatorios entre 0 y 99
done

echo "Números generados aleatoriamente: ${numeros[@]}"

# Encontrar los dos números menores
menor1=${numeros[0]}
menor2=${numeros[0]}
i=1
while [ $i -lt $cantidad_numeros ]; do
  if [ ${numeros[i]} -lt $menor1 ]; then
    menor2=$menor1
    menor1=${numeros[i]}
  elif [ ${numeros[i]} -lt $menor2 ] && [ ${numeros[i]} -ne $menor1 ]; then
    menor2=${numeros[i]}
  fi
  ((i++))
done

echo "Los dos números menores son: $menor1 y $menor2"

# Encontrar todos los números iguales a los menores y realizar la suma
suma=0
for num in "${numeros[@]}"; do
  if [[ $num -eq $menor1 || $num -eq $menor2 ]]; then
    suma=$((suma + num))
  fi
done

echo "La suma de los números iguales a los menores es: $suma"
