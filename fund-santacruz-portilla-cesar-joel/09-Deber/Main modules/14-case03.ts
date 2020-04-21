import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseThree(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = idArchivo();
const arregloCarros: carro[] = await arregloCargado();

const buscar = await prompts(
    /*{
    type: 'text',
    name: 'nombre',
    message: 'Buscar por ID o por NOMBRE'
},*/
{
    type: 'number',
    name: 'id',
    message: 'Buscar por ID o por NOMBRE'
}
);
const indiceEncontrado6 = arregloCarros.find(
            function(valorActual,){
                return valorActual.id == buscar.id ;
            }
        );
console.log(indiceEncontrado6);
}