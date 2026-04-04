#include <stdio.h>

extern long to_int(float r1, float r2, float r3, float r4, float r5, float r6, float r7, float r8, float a);
extern int plus_one(int r1, int r2, int r3, int r4, int r5, int r6, int a);

int main(void){
    float value_float = 3.14f;
    long result;

    printf("El valor a enviar: %f\n", value_float);

    result = to_int(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, value_float);
    printf("Float convertido a entero: %li\n", result);

    result = plus_one(0, 0, 0, 0, 0, 0, result);

    return 0;
}

int to_int_function(float numb_float){
    return to_int(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, numb_float);
}

int plus_one_function(int numb_int){
    return -1;
}