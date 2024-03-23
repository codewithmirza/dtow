// Assuming you have a function to load the C WebAssembly module (check your environment/tools for specifics)
async function loadCModule() {
  const response = await fetch('my_c_module.wasm');
  const buffer = await response.arrayBuffer();
  return await WebAssembly.compile(buffer);
}

import * as dartProgram from './main.dart.mjs';

async function callCFunctionFromJS(value1, value2) {
  // Load the C module
  const cModule = await loadCModule();

  const imports = {
    // Provide the C module instance here
    'my_c_module': {
      add: cModule.exports.add, // Assuming 'add' is the exported function from C
    },
  };

  const module = await dartProgram.instantiate(
    WebAssembly.compileStreaming(fetch('main.dart.wasm')),
    imports
  );

  const result = module.exports.myDartFunction(value1, value2);
  document.getElementById('output-paragraph').textContent = result;
}

// Event listener remains the same
document.getElementById('call-button').addEventListener('click', () => {
  const inputValue1 = document.getElementById('input1').value;
  const inputValue2 = document.getElementById('input2').value;
  callCFunctionFromJS(inputValue1, inputValue2);
});