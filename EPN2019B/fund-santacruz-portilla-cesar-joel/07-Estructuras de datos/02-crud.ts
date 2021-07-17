import * as prompts from 'prompts';
import {RespuestaEdad} from './interfaces/respuesta-edad.interface';
import {RespuestaNombre} from './interfaces/respuesta-nombre.interface';

function main(){
    obtenerDatosAnimalPerritoSincrono()
    .then()
    .catch();
}
/*
function obtenerDatosAnimalPerrito(){

    //paradigma de programacion

    //SINCRONO VS ASINCRONO
    console.log('Inicio');

    const promesaEdad = prompts({
        type: 'number',
        name: 'edad',
        message: 'puedes darme tu edad?'
    })
    console.log(promesaEdad);
    promesaEdad
    .then(//ok
        (datos)=>{
            console.log('datos',datos); //AQUI PUEDO SEGUIR

            /////
            const promesaNombre = prompts({
                type: 'text',
                name: 'nombre',
                message: 'puedes darme tu nombre?'
            });
            promesaNombre
                .then(
                    (datosNombre)=>{
                        console.log('Nombre',datosNombre);
                    }
                )
                .catch(
                    (errorNombre)=>{
                        console.log('Error',errorNombre)
                    }
                );
            /////
        }
    )
    .catch(
        (error)=>{
            console.log('Error',error)
        }
    );
    console.log('Fin');
}
*/
async function obtenerDatosAnimalPerritoSincrono(){ // => promesa sincrono

    console.log('Inicio');

    const preguntas = [
        {
            type: 'number',
            name: 'edad',
            message: 'puedes darme tu edad?'
        },
        {
            type: 'text',
            name: 'nombre',
            message: 'puedes darme tu nombre?'
        },
        {
            type: 'text',
            name: 'cedula',
            message: 'puedes darme tu cedula?'
        }
    ]

    /*const edad: RespuestaEdad = await prompts({
        type: 'number',
        name: 'edad',
        message: 'puedes darme tu edad?'
    });
    const nombre: RespuestaNombre = await prompts({
        type: 'text',
        name: 'nombre',
        message: 'puedes darme tu nombre?'
    });
    const cedula = await prompts({
        type: 'number',
        name: 'cedula',
        message: 'puedes darme tu cedula?'
    }); */
    const respuestaEdad = await prompts(preguntas);
    console.log('respuesta', respuestaEdad)
    console.log('Fin');
}
main();

//si tenemos una promesa solo podemos hacerlo dentro de las funciones en javascript no podemos hacerlo afuera
