import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { escribirArchivo } from "./03-escribir-archivo";

////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function caseOne(){
const arregloPreguntas = await iniciar();
let contador:number
    contador = await idArchivo();
const arregloCarros: carro[] = await arregloCargado();
const respuestaCarroUno = await prompts(arregloPreguntas);
const nuevoRegistroUno = {
    id: contador,
    nombre: respuestaCarroUno.nombre,
    modelo: respuestaCarroUno.modelo,
    anio: respuestaCarroUno.anio,
    origen: respuestaCarroUno.origen,
    precio: respuestaCarroUno.precio
};
contador = contador + 1;
arregloCarros.push(nuevoRegistroUno);


console.log(arregloCarros);

const arregloTexto = JSON.stringify(arregloCarros);
escribirArchivo(
    './ejemplo.txt',
    arregloTexto
    );

}