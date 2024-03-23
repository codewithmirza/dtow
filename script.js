// main.js
import * as dartProgram from './main.dart.mjs';

async function callCFunctionFromJS(value) {
  const imports = {};

  const module = await dartProgram.instantiate(
    WebAssembly.compileStreaming(fetch('main.dart.wasm')),
    imports
  );

  // Call the function from the module
  const result = module.exports.myCFunction(value);

  // Display the result on the screen
  document.getElementById('output-paragraph').textContent = result;
}

// Use the function here, for example on button click
document.getElementById('call-button').addEventListener('click', () => {
  const inputValue = document.getElementById('input').value;
  callCFunctionFromJS(inputValue);
});