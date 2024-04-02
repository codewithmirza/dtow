# Compiled some C code to WASM and called it from Dart (non-Flutter) web app compiled to WASM.

This project demonstrates the process of compiling C code into WebAssembly (WASM) and calling it from a Dart web application, also compiled to WebAssembly. By leveraging WebAssembly, developers can integrate performance-sensitive C code directly into Dart web applications without the need for server-side processing. 

## Project Description

For this project, we've compiled a small C module using Emscripten to create a WASM module. This module contains a single C function that will be invoked from Dart code. The Dart code utilizes the `dart:ffi` library and `@Native` annotations to import the C function and interact with it. Additionally, the Dart code makes use of the `package:web` library to interact with the DOM for input and output purposes.

The workflow involves compiling the C code to WASM using Emscripten and the Dart code to WASMGC using the `dart compile wasm` command. This generates `main.dart.mjs` and `main.dart.wasm` files. The `main.dart.mjs` file is used to instantiate and invoke the WebAssembly-compiled Dart program.

## Sample Project Details

### Setup Instructions

1. Compile the C module to WASM:
   ```
   emcc my_c_module.c WASM=1 -o my_c_module.wasm
   ```

2. Compile the Dart code to WASMGC:
   ```
   dart compile wasm main.dart
   ```



---

