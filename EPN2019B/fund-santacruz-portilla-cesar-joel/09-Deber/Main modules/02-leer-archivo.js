"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs-extra");
function leerArchivo(path) {
    var resultado = fs.readFileSync(path, // PATH
    'utf-8' // CODIFICACION 
    );
    return resultado;
}
exports.leerArchivo = leerArchivo;
