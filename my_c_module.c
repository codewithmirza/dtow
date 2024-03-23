#include <stdio.h>

// Mark the function as exportable to make it accessible from Dart
__attribute__((export_name("myCFunction")))
int myCFunction(int value) {
    printf("Received value from Dart: %d\n", value);
    return value * 2;
}
