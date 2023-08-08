typedef struct {
    float real;
    float imag;
} ComplexNumber;

// Funciones para realizar operaciones con números complejos
ComplexNumber divide(ComplexNumber num1, ComplexNumber num2) {
    ComplexNumber result;
    float denominator = num2.real * num2.real + num2.imag * num2.imag;
    result.real = (num1.real * num2.real + num1.imag * num2.imag) / denominator;
    result.imag = (num1.imag * num2.real - num1.real * num2.imag) / denominator;
    return result;
}