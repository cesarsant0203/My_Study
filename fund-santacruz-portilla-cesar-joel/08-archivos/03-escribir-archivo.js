"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs");
function escribirArchivo(path, contenido) {
    fs.writeFileSync(path, //path
    contenido, //contenido
    'utf8' //codificacion
    );
}
exports.escribirArchivo = escribirArchivo;
