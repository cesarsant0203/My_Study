import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { escribirArchivo } from "./03-escribir-archivo";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseTwoFive(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = idArchivo();
const arregloCarros: carro[] = await arregloCargado();

console.log('Cual carro quieres Editar?');
                console.log(arregloCarros);


                const idABuscar5 = await prompts(
                    {
                        type: 'number',
                        name: 'id',
                        message: 'Ingresa el ID del registro a Editar'
                }
                )
                const indiceEncontrado5 = arregloCarros.findIndex( // return CONDICION ->
                    function (valorActual,){
                        return valorActual.id == idABuscar5.id; // Nos devuelve el INDICE
                    }
                )
                console.log('Indice encontrado:', indiceEncontrado5);
                const precioAEditar = await prompts(
                    {
                    type: 'number',
                    name: 'precio',
                    message: 'Ingresa el nuevo precio'
                }
                )
                arregloCarros[indiceEncontrado5].precio = precioAEditar.precio;
                console.log(arregloCarros);
                const arregloTexto = JSON.stringify(arregloCarros);
        console.log(arregloTexto);
        escribirArchivo(
        './ejemplo.txt',
        arregloTexto
        );
}