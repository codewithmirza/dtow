// my_c_module.c
#include <emscripten.h>

EMSCRIPTEN_KEEPALIVE
int myCFunction(int value) {
    return value * 2;
}