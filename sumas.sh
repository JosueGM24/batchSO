#!/bin/bash

# Recorrer todas las cadenas ingresadas al llamar el archivo
for cadena in "$@"; do
  # Convertir la cadena en un arreglo de números
  numeros=($cadena)
  
  # Calcular la suma de los números en la cadena
  suma=0
  for num in "${numeros[@]}"; do
    suma=$((suma + num))
  done
  
  # Imprimir la suma de los números en la cadena
  echo "La suma de ${numeros[*]} es $suma"
done
