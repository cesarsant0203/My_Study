"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function some(arreglo, funcion) {
    var funSome = false;
    for (var i = 0; i < arreglo.length; i++) {
        var respuestaFuncion = funcion(arreglo[i], i, arreglo);
        if (respuestaFuncion == true) {
            return true;
        }
    }
    return funSome;
}
exports.some = some;
