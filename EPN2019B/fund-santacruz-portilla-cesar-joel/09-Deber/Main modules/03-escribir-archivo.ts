import * as fs from 'fs-extra';

export function escribirArchivo(
    path: string,
    contenido: string){
    fs.writeFileSync(
        path,  // PATH
        contenido,  // CONTENIDO
        'utf8' // CODIFICACION
        );
}