import 'dart:ffi' as ffi;
import 'package:web/web.dart';

// Define the C function signature
typedef NativeMyCFunction = ffi.Int32 Function(ffi.Int32);

// Use NativeFunction for direct binding
external NativeMyCFunction myCFunction;

// Internal function to handle C calls
void callCFunctionFromDart(int value) {
  try {
    final result = myCFunction(value as ffi.Int32);
    print('Result from C function: $result');

    final outputElement = document.getElementById('output') as HTMLTextAreaElement;
    outputElement.value = 'Result: $result';
  } on ArgumentError {
    print('Error looking up function pointer');
  }
}

// Dart function exposed to JavaScript (without JS interop decorator)
void callCFunction(int value) {
  callCFunctionFromDart(value); // Delegate to the internal function
}

void main() async {
  final cModule = ffi.DynamicLibrary.open('my_c_module.wasm');

  try {
    // Load the function pointer
    myCFunction = cModule
        .lookup<ffi.Pointer<ffi.NativeFunction<NativeMyCFunction>>>('myCFunction')
        .value as NativeMyCFunction;
  } on ArgumentError {
    print('Error looking up function pointer');
  }
}
