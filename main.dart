// main.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef MyCFunction = Int32 Function(Pointer<Int32>);
typedef MyDartFunction = int Function(Pointer<Int32>);

void main() {
  final dylib = DynamicLibrary.open('my_c_module.wasm');
  final myCFunctionPointer =
      dylib.lookupFunction<MyCFunction, MyDartFunction>('myCFunction');
  final argument = calloc<Int32>();
  argument.value = 10;
  int result = myCFunctionPointer(argument);
  print(result);
  calloc.free(argument);
}
