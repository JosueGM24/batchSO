#!/bin/bash

# Obtener los monomios del usuario
echo "Ingresa los monomios separados por espacios (ejemplo: (x+1) (x+2) ...):"
read expresiones

# Crear un archivo de entrada para Maxima
echo "load(simplify_sum);" > input.mac
echo "expand("$(echo "$expresiones" | sed 's/+/\\+/g')");" >> input.mac
echo "quit();" >> input.mac

# Ejecutar Maxima y guardar el resultado en un archivo
maxima -b input.mac > output.txt

# Extraer el resultado del archivo
resultado=$(sed -n '/(%o1)/s///p' output.txt)

# Mostrar el resultado
echo "El resultado es:"
echo "$resultado"

# Eliminar archivos temporales
rm input.mac output.txt
