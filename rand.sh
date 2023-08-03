#!/bin/bash

# Pedir la cantidad de números aleatorios al usuario
read -p "Ingresa la cantidad de números aleatorios: " cantidad_numeros

# Generar la cantidad de números aleatorios y guardarlos en un arreglo
numeros=()
for ((i=0; i<cantidad_numeros; i++)); do
  numeros[i]=$((RANDOM % 100))  # Generar números aleatorios entre 0 y 99
done

echo "Números aleatorios generados: ${numeros[@]}"

# Crear un archivo con los números aleatorios en un archivo .txt
echo "${numeros[@]}" > numeros.txt
echo "Números aleatorios guardados en el archivo 'numeros.txt'."

# Pedir al usuario un número objetivo
read -p "Ingresa un número objetivo: " numero_objetivo

# Función para generar las combinaciones que suman el número objetivo
function find_combinations {
  local objetivo=$1
  shift
  local numeros=("$@")
  local n=${#numeros[@]}
  local combinacion=()

  function backtrack {
    local sum=0
    for num in "${combinacion[@]}"; do
      ((sum+=num))
    done

    if [ $sum -eq $objetivo ]; then
      echo "Combinación encontrada: ${combinacion[*]}"
    elif [ $sum -lt $objetivo ]; then
      for ((i=$1; i<$n; i++)); do
        combinacion+=(${numeros[i]})
        backtrack $i
        unset 'combinacion[${#combinacion[@]}-1]'
      done
    fi
  }

  backtrack 0
}

echo "Buscando combinaciones que suman $numero_objetivo con los números aleatorios..."
find_combinations $numero_objetivo "${numeros[@]}"
