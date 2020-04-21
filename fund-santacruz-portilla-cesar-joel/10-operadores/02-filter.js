"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function restar(numUno, numDos) {
    return numUno - numDos;
}
exports.restar = restar;
function sumar(numUno, numDos) {
    return numUno + numDos;
}
exports.sumar = sumar;
function calcular(funcion, numUno, numDos) {
    var valorInicial = 10;
    return funcion(numUno, numDos, valorInicial);
}
exports.calcular = calcular;
function filter(arreglo, funcion) {
    var arregloFiltrado = [];
    for (var i = 0; i < arreglo.length; i++) {
        var respuestaFuncion = funcion(arreglo[i], i, arreglo);
        if (respuestaFuncion == true) {
            arregloFiltrado.push(arreglo[i]);
        }
    }
    return arregloFiltrado;
}
exports.filter = filter;
console.log(calcular(sumar, 1, 2)); // 3
console.log(calcular(restar, 5, 2)); // 3
