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