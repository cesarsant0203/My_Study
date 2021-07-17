import { leerArchivo } from "./02-leer-archivo";
import { escribirArchivo } from "./03-escribir-archivo";
import * as prompts from 'prompts';
import { Estudiante } from "./interfaces/estudiante.interface"

async function main(){
    let contador = 1;
    const contenidoArchivo = leerArchivo(
        './ejemplo.txt'
    );
    const arregloCargadoDelArchivo = JSON.parse(contenidoArchivo)
    const arregloEstudiantes: Estudiante[] = arregloCargadoDelArchivo;
    const arregloPreguntas = [
        {
            type: 'text',
            name: 'nombre',
            message: 'Ingresa tu nombre' // example Samantha-uribe, dont forget the phen
        }
    ];

    const respuestaEstudianteUno = await prompts(arregloPreguntas);

    const nuevoRegistroUno = {
        id:contador,
        nombre: respuestaEstudianteUno.nombre
    }
    contador = contador + 1;

    arregloEstudiantes.push(nuevoRegistroUno);

    console.log(respuestaEstudianteUno);

    const respuestaEstudianteDos = await prompts(arregloPreguntas);

    const nuevoRegistroDos = {
        id:contador,
        nombre: respuestaEstudianteDos.nombre
    }

    contador = contador + 1;
    arregloEstudiantes.push(nuevoRegistroDos);

    console.log(respuestaEstudianteDos);
    console.log('cual usuario quieres editar')
    console.log(arregloEstudiantes);


    const idABuscar = await prompts({
        type: 'number',
        name: 'id',
        message: 'Ingresa el id del registro a editar'
    })

    const indiceEncontrado = arregloEstudiantes.findIndex( //return condicion 
        function(valorActual, indice, arreglo){
            console.log(valorActual);
            console.log(indice);
            console.log(arreglo);
            return valorActual.id == idABuscar.id;
        }
    )
    console.log('indiceEncontrado', indiceEncontrado + 1);

 const nombreAEditar = await prompts({
        type: 'text',
        name: 'nombre',
        message: 'Ingresa el nombre a editar'
    })

    arregloEstudiantes[indiceEncontrado].nombre = nombreAEditar.nombre;
    console.log(arregloEstudiantes)


const buscar = await prompts({
        type: 'text',
        name: 'nombre',
        message: 'BUSCAR POR ID O POR NOMBRE'
    })

const estudianteEncontrado = arregloEstudiantes.find(
        function(valorActual){
            return valorActual.nombre == buscar.nombre;
        }
    )
console.log(estudianteEncontrado);
















    /*
    const textoLeido = leerArchivo('./ejemplo.txt');
    const nuevoContenido = 'tengo hambre \n' + textoLeido ;
    escribirArchivo('./ejemplo.txt', nuevoContenido);
    console.log(textoLeido)
    */
}

main();