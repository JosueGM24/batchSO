#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Definición de la estructura para números complejos
typedef struct {
    float real;
    float imag;
} ComplexNumber;

// Funciones para realizar operaciones con números complejos
ComplexNumber add(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    result.real = num1.real + num2.real;
    result.imag = num1.imag + num2.imag;
    return result;
}

ComplexNumber subtract(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    result.real = num1.real - num2.real;
    result.imag = num1.imag - num2.imag;
    return result;
}

ComplexNumber multiply(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    result.real = num1.real * num2.real - num1.imag * num2.imag;
    result.imag = num1.real * num2.imag + num1.imag * num2.real;
    return result;
}

ComplexNumber divide(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    float denominator = num2.real * num2.real + num2.imag * num2.imag;
    result.real = (num1.real * num2.real + num1.imag * num2.imag) / denominator;
    result.imag = (num1.imag * num2.real - num1.real * num2.imag) / denominator;
    return result;
}

// Función para convertir una cadena en un número complejo
ComplexNumber parseComplex(const char *input) {
    ComplexNumber num;
    char *endptr;
    
    num.real = strtof(input, &endptr);
    if (*endptr == '+') {
        num.imag = strtof(endptr + 1, NULL);
    } else if (*endptr == '-') {
        num.imag = strtof(endptr, NULL);
    } else {
        num.imag = 0;
    }
    
    return num;
}

int main() {
    char input1[50], input2[50];
    ComplexNumber num1, num2, result;
    int choice;

    printf("Ingrese el primer numero complejo (ejemplo: 2+3i): ");
    scanf("%s", input1);
    num1 = parseComplex(input1);
    
    printf("Ingrese el segundo numero complejo (ejemplo: 1-2i): ");
    scanf("%s", input2);
    num2 = parseComplex(input2);

    printf("Seleccione la operación a realizar:\n");
    printf("1. Suma\n2. Resta\n3. Multiplicacion\n4. Division\n");
    scanf("%d", &choice);

    switch (choice) {
        case 1:
            result = add(num1, num2);
            printf("Resultado de la suma: %.2f + %.2fi\n", result.real, result.imag);
            break;
        case 2:
            result = subtract(num1, num2);
            printf("Resultado de la resta: %.2f + %.2fi\n", result.real, result.imag);
            break;
        case 3:
            result = multiply(num1, num2);
            printf("Resultado de la multiplicacion: %.2f + %.2fi\n", result.real, result.imag);
            break;
        case 4:
            result = divide(num1, num2);
            printf("Resultado de la division: %.2f + %.2fi\n", result.real, result.imag);
            break;
        default:
            printf("Opcion invalida.\n");
    }

    return 0;
}
