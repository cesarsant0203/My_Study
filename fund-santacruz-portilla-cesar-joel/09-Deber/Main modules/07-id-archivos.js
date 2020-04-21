"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var _02_leer_archivo_1 = require("./02-leer-archivo");
function arregloCargado() {
    var contenidoArchivo = _02_leer_archivo_1.leerArchivo('./ejemplo.txt');
    var arregloCargadoDeArchivo; // undefined
    arregloCargadoDeArchivo = JSON.parse(contenidoArchivo);
    return arregloCargadoDeArchivo;
}
exports.arregloCargado = arregloCargado;
function idArchivo() {
    var arregloCargadoDeArchivo = arregloCargado();
    var minimoId = -1;
    arregloCargadoDeArchivo
        .forEach(function (valorActual) {
        var idActual = valorActual.id;
        if (idActual > minimoId) {
            minimoId = idActual;
        }
    });
    minimoId = minimoId + 1;
    var contador = minimoId;
    return contador;
}
exports.idArchivo = idArchivo;
