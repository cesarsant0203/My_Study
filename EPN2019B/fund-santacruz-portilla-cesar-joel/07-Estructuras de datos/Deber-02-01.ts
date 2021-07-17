import { seleccionado } from './interfaces/seleccionado.interface';
import * as prompts from 'prompts';

async function main(){

    WelcomeCarros();
}

async function WelcomeCarros(){
    console.log("\n welcome to our car register assistant \n");
    const principal = [];
    menu(principal);
}

async function menu(principal: any[])
{
    console.log("\n\n1.Crear un directorio\n");
    console.log("2.Editar el directorio\n");
    console.log("3.Eliminar una pelicula\n");
    console.log("4.Agregar una pelicula\n");
    console.log("5.Salir\n");
    const opcion = await funcionOpcion();
    switch(opcion)
    {
        case 1: 
        principal = await crearDirectorio();
        console.log("El directorio actual es:\n", principal);
        menu(principal);
        break;
        case 2: break;
        case 3: break;
        case 4:
        const longitudNueva = principal.length;
        principal = await agregarPelicula(longitudNueva, principal);
        console.log("El nuevo directorio es:\n", principal); 
        menu(principal);
        break;
        default:
        console.log("Hasta Luego!!");
        break;
    }
}

async function agregarPelicula(longitud:number, principal: any[])
{
    const peliculaNueva = await pedirDatos();
    principal[longitud] = peliculaNueva;
    return principal;
}

async function crearDirectorio()
{
    console.log("\nEmpecemos!!\n");
    const peliculasInicialPregunta =
    {
        type:'number',
        name:'numeroDeOpcion',
        message:'¿Cuantas peliculas quieres añadir para empezar?',
        validate: value => value < 0? `Debe ser un numero mayor a 0.`:true
    }
    const peliculasInicial:opcionInterface = await prompts(peliculasInicialPregunta);
    const cantidadDePeliculas = peliculasInicial.numeroDeOpcion;
    const principal = [];

    for(let i = 0;i <cantidadDePeliculas ;i ++)
    {
        principal[i] = await pedirDatos();
    }

    return principal;
    
}

async function pedirDatos()
{
    const peliculas =
    [
        {
            type:'text',
            name:'nombrePelicula',
            message:'\nIngresar el nombre de la pelicula:'
        },
        {
            type:'text',
            name:'generoPelicula',
            message:'Ingresar el genero de la pelicula:'
        },
        {
            type:'number',
            name:'duracionPelicula',
            message:'Ingresar la duracion de la pelicula:'
        },
        {
            type:'text',
            name:'directorPelicula',
            message:'Ingresar el director de la pelicula:'
        },
        {
            type:'text',
            name:'protagonistaPelicula',
            message:'¿Cual es el protagonista de la pelicula?'
        }
    ]
    const respuestasPelicula:peliculaInterface = await prompts(peliculas);
    return respuestasPelicula;
}

async function funcionOpcion()
{
    const opcion = 
    {
        type:'number',
        name:'numeroDeOpcion',
        message:'¿Que desea realizar?',
        validate: value => (value < 0 || value > 5) ? `ESCOGER SOLO DE ENTRE LAS OPCIONES QUE APARECEN EN PANTALLA`:true
    }
    const opcionRespuesta:opcionInterface = await prompts(opcion);
    return opcionRespuesta.numeroDeOpcion;
}















































































/*

const seleccion = await bienvenida();

    switch(seleccion){
        case 1:
            obtenerDatosCarros();
            break;
    };
    .then()
    .catch();


 async function bienvenida(){
     console.log("seleccione que desea realizar \n 1.Crear una nueva entrada \n 2.editar la entrada \n 3.eliminar un elemento de la entrada \n 4.agregar elemento")
     const operacion = {
        type: 'number',
        name: 'numero',
        message: 'respuesta'

     }
    const respuestaOperacion:seleccionado = await prompts(operacion);
    console.log(respuestaOperacion);
    return respuestaOperacion.numero
 }
async function obtenerDatosCarros(){ // => promesa sincrono

    console.log('Inicio');

    const carros = [
        {
            type: 'text',
            name: 'marca',
            message: 'puedes darme la marca del carro?'
        },
        {
            type: 'text',
            name: 'modelo',
            message: 'puedes darme el modelo del carro?'
        },
        {
            type: 'text',
            name: 'placa',
            message: 'puedes darme la placa del carro?'
        }
    ]

    const respuestaCarro = await prompts(carros);
    console.log('respuesta', respuestaCarro)
    console.log('Fin');

}


async function obtenerOpciones(){
    const opciones = 
        {
            type: 'text',
            name: 'marca',
            message: 'puedes darme la marca del carro?'
        }
        const opcionSeleccionada:seleccionado = await prompts(opciones);
        console.log(opcionSeleccionada);
}
main();

//si tenemos una promesa solo podemos hacerlo dentro de las funciones en javascript no podemos hacerlo afuera
/*     if ( respuestaOperacion ==  1 ){
         obtenerDatosCarros()
     }else{
         if (respuestaOperacion == 2){
             console.log("1.editar marca \n 2. editar modelo \n 3.editar placa")
         }else{console.log("errorsswsws")}
     }
     */
