import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { escribirArchivo } from "./03-escribir-archivo";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseTwoTwo(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = idArchivo();
const arregloCarros: carro[] = await arregloCargado();

console.log('Cual carro quieres Editar?');
                console.log(arregloCarros);


                const idABuscar2 = await prompts(
                    {
                        type: 'number',
                        name: 'id',
                        message: 'Ingresa el ID del registro a Editar'
                }
                )
                const indiceEncontrado2 = arregloCarros.findIndex( // return CONDICION ->
                    function (valorActual,){
                        return valorActual.id == idABuscar2.id; // Nos devuelve el INDICE
                    } // Si encuentra nos devuelve el indice
                    // No encuentra
                )
                console.log('Indice encontrado:', indiceEncontrado2);
                const modeloAEditar = await prompts(
                    {
                    type: 'text',
                    name: 'modelo',
                    message: 'Ingresa el nuevo modelo'
                }
                )
                arregloCarros[indiceEncontrado2].modelo = modeloAEditar.modelo;
                console.log(arregloCarros);
                const arregloTexto = JSON.stringify(arregloCarros);
        escribirArchivo(
        './ejemplo.txt',
        arregloTexto
        );
}