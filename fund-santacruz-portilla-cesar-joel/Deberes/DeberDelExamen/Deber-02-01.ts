import * as prompts from 'prompts';
function main(){
    obtenerDatosCarros()
    .then()
    .catch();
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
main();

//si tenemos una promesa solo podemos hacerlo dentro de las funciones en javascript no podemos hacerlo afuera
