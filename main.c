#include <stdio.h>
#include "complex.h"

// Definición de la estructura para números complejos
typedef struct {
    float real;
    float imag;
} ComplexNumber;


int main() {
    ComplexNumber num1, num2, result;
    int choice;

    printf("Ingrese la parte real e imaginaria del primer número (ejemplo: 2 3): ");
    scanf("%f %f", &num1.real, &num1.imag);

    printf("Ingrese la parte real e imaginaria del segundo número (ejemplo: 1 2): ");
    scanf("%f %f", &num2.real, &num2.imag);

    printf("Seleccione la operación a realizar:\n");
    printf("1. Suma\n2. Resta\n3. Multiplicación\n4. División\n");
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
            printf("Resultado de la multiplicación: %.2f + %.2fi\n", result.real, result.imag);
            break;
        case 4:
            result = divide(num1, num2);
            printf("Resultado de la división: %.2f + %.2fi\n", result.real, result.imag);
            break;
        default:
            printf("Opción inválida.\n");
    }

    return 0;
}
