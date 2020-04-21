import { leerArchivo } from "./02-leer-archivo";

export function arregloCargado(){
const contenidoArchivo = leerArchivo('./ejemplo.txt');
    let arregloCargadoDeArchivo; // undefined
        arregloCargadoDeArchivo = JSON.parse(contenidoArchivo);

        return arregloCargadoDeArchivo
}
export  function idArchivo(){
    const arregloCargadoDeArchivo =  arregloCargado();

    let minimoId = -1;
     arregloCargadoDeArchivo
        .forEach(
            function(valorActual){
                const idActual = valorActual.id;
                if(idActual > minimoId){
                    minimoId = idActual
                }
            }
        );
    minimoId =   minimoId + 1;
    const contador:number =  minimoId
            return contador
        }
