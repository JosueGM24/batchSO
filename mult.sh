#!/bin/bash

# Función para multiplicar dos monomios
multiplicar_monomios() {
    local expr1="$1"
    local expr2="$2"
    resultado=$(echo "expand(($expr1) * ($expr2))" | bc -l)
    echo "$resultado"
}

# Obtener los monomios del usuario
echo "Ingresa los monomios separados por espacios (ejemplo: (x+1) (x+2) ...):"
read expresiones

# Reemplazar 'x' con 'x' para que bc pueda entenderlo
expresiones="${expresiones//x/x}"

# Separar las expresiones en monomios individuales
monomios=($(echo "$expresiones"))

# Calcular la multiplicación de los monomios
resultado="${monomios[0]}"
for ((i = 1; i < ${#monomios[@]}; i++)); do
    resultado=$(multiplicar_monomios "$resultado" "${monomios[i]}")
done

# Reemplazar 'x' con 'x' para mostrar el resultado en formato legible
resultado="${resultado//x/x}"

# Mostrar el resultado
echo "El resultado es:"
echo "$resultado"
