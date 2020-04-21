import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { escribirArchivo } from "./03-escribir-archivo";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseFour(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = idArchivo();
const arregloCarros: carro[] = await arregloCargado();

console.log("Cual carro quieres borrar")
                const borrar = await prompts(
                {
                    type: 'text',
                    name: 'id',
                    message: 'Buscar por ID o por NOMBRE'
                }
                );
                const indiceEncontrado7 = arregloCarros.findIndex(
                            function(valorActual){
                                return valorActual.id == borrar.id ;
                            }
                        );
            arregloCarros.splice(indiceEncontrado7);


            console.log(arregloCarros);

            const arregloTexto = JSON.stringify(arregloCarros);
            escribirArchivo(
            './ejemplo.txt',
            arregloTexto
            );
}