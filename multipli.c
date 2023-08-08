typedef struct {
    float real;
    float imag;
} ComplexNumber;

// Funciones para realizar operaciones con números complejos
ComplexNumber multiply(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    result.real = num1.real * num2.real - num1.imag * num2.imag;
    result.imag = num1.real * num2.imag + num1.imag * num2.real;
    return result;
}