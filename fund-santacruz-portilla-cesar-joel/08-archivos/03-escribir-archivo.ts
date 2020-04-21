import * as fs from 'fs';

export function escribirArchivo(path: string, contenido:string){
    fs.writeFileSync(
        path, //path
        contenido, //contenido
        'utf8' //codificacion
    );
}