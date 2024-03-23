import 'dart:ffi';

typedef AddFunc = Int32 Function(Int32, Int32);
typedef AddFuncDart = int Function(int, int);

int myDartFunction(int value1, int value2) {
  final dylib = DynamicLibrary.open('my_c_code.wasm');

  final AddFuncDart add =
      dylib.lookup<NativeFunction<AddFunc>>('add').asFunction<AddFuncDart>();

  return add(value1, value2);
}

void main(List<String> arguments) {
  final value1 = int.parse(arguments[0]);
  final value2 = int.parse(arguments[1]);
  print(myDartFunction(value1, value2)); // Print the result to the console
}
