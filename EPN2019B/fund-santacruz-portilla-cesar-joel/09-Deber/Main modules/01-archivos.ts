import { escribirArchivo } from "./03-escribir-archivo";
import { carro } from "../interfaces/carro.interface";
import { arregloCargado } from "./07-id-archivos";
import { cases } from "./16-switch";
import { intro } from "./17-intro";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
export async function All(){
        const arregloCarros: carro[] = await arregloCargado();
        intro();
await cases();
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        const arregloTexto = JSON.stringify(arregloCarros);
        console.log(arregloTexto);
        escribirArchivo(
        './ejemplo.txt',
        arregloTexto
        );
    }