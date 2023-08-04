#!/bin/bash

# Función para generar números aleatorios y guardarlos en el archivo "numeros.txt"
generate_random_numbers() {
    echo "Ingrese la cantidad de números aleatorios que desea generar:"
    read num_count

    echo "Generando $num_count números aleatorios en el rango de 0 al 10..."
    > numeros.txt # Limpiamos el archivo para empezar de cero
    for ((i = 0; i < num_count; i++)); do
        random_number=$((RANDOM % 10))
        echo $random_number
        echo $random_number >> numeros.txt
    done
}

# Función para buscar combinaciones de números que sumen el número ingresado por el usuario
search_combinations() {
    echo "Ingrese el número para buscar combinaciones:"
    read target_number

    # Buscamos combinaciones y las guardamos en el archivo "resultado.txt"
    echo "Buscando combinaciones que sumen $target_number..."
    > resultado.txt # Limpiamos el archivo para empezar de cero
    while IFS= read -r num1; do
        while IFS= read -r num2; do
            if [ "$((num1 + num2))" -eq "$target_number" ]; then
                echo "$num1 $num2" >> resultado.txt
            fi
        done < <(grep -v "^$num1$" numeros.txt) # Usamos grep para evitar sumar el mismo número dos veces
    done < numeros.txt
}

# Ejecución del programa
generate_random_numbers
echo "Los números aleatorios generados y guardados en numeros.txt son:"
cat numeros.txt
search_combinations
echo "Las combinaciones que suman el número ingresado se encuentran en el archivo 'resultado.txt'"