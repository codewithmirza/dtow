import 'dart:ffi' as ffi;

// Define the C function signature
typedef NativeMyCFunction = ffi.Int32 Function(ffi.Int32);

// Expose the C function to JavaScript using @JS()
external NativeMyCFunction myCFunction;

// Function to handle C calls from Dart (if needed)
void callCFunctionFromDart(int value) {
  try {
    final result =
        myCFunction(value as ffi.Int32); // Remove cast if not necessary
    print('Result from C function: $result');
  } on ArgumentError catch (e) {
    print('Error looking up function pointer: $e');
  }
}

// Entry point for the Dart program
void main() async {
  final cModule = ffi.DynamicLibrary.open(
      'my_c_module.wasm'); // Assuming the WASM file exists

  try {
    // Load the function pointer
    myCFunction = cModule
        .lookup<ffi.Pointer<ffi.NativeFunction<NativeMyCFunction>>>(
            'myCFunction')
        .value as NativeMyCFunction;
  } on ArgumentError catch (e) {
    print('Error looking up function pointer: $e');
  }
}
