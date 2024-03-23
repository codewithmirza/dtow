// wasm_bridge.dart
@JS()
library wasm_bridge;

import 'dart:js_interop';

@JS('callWasmFunction') // Expose the Dart function to JavaScript
external int callWasmFunction(int a, int b); // Define the WebAssembly function

// Define a Dart function to add two numbers
int add(int a, int b) {
  return a + b;
}