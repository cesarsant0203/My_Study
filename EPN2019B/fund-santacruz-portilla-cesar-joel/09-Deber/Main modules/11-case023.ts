import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { escribirArchivo } from "./03-escribir-archivo";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseTwoThree(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = idArchivo();
const arregloCarros: carro[] = await arregloCargado();

console.log('Cual carro quieres Editar?');
                console.log(arregloCarros);


                const idABuscar3 = await prompts(
                    {
                        type: 'number',
                        name: 'id',
                        message: 'Ingresa el ID del registro a Editar'
                }
                )
                const indiceEncontrado3 = arregloCarros.findIndex( // return CONDICION ->
                    function (valorActual,){
                        return valorActual.id == idABuscar3.id; // Nos devuelve el INDICE
                    } // Si encuentra nos devuelve el indice
                    // No encuentra
                )
                console.log('Indice encontrado:', indiceEncontrado3);
                
                const anioAEditar = await prompts(
                    {
                    type: 'text',
                    name: 'anio',
                    message: 'Ingresa el nuevo anio'
                }
                )
                arregloCarros[indiceEncontrado3].anio = anioAEditar.anio;
                console.log(arregloCarros);
                const arregloTexto = JSON.stringify(arregloCarros);
        console.log(arregloTexto);
        escribirArchivo(
        './ejemplo.txt',
        arregloTexto
        );
}