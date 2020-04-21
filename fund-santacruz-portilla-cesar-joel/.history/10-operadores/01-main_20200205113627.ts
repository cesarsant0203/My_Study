import { filter } from "./02-filter";
import { every } from "./03-every";
import { some } from "./04-some";
import { forEach } from "./05-forEach";

function main(){
    const arregloEstudiantes/*:any*/ =[
        {id:1, nombre:"Juan", nota:7}
        {id:2, nombre:"Pepe", nota:6}
        {id:3, nombre:"jose", nota:4}
        {id:4, nombre:"kaki", nota:9}
        {id:5, nombre:"karen", nota:9}
    ]
    //operadro -> forEach
    //enviamos -> nada
    //recivimos -> nada
    ////////////////////////////////////////////////////////////////
     const respuestaForEach = arregloEstudiantes.forEach(
        function(valorActual, indice, arreglo){
            console.log(valorActual.nota = valorActual.nota*2)
           // valorActual.nota20 = valorActual.nota*2
        }
    );console.log(arregloEstudiantes)
    

  
    console.log(respuestaForEach);

    //map -> transforma el arreglo (mutar el arr)
    //enviamos -> valorActual
    //recibimos nuevo arr con valores modificados
    ////////////////////////////////////////////////////////////////
    const respuestaMap = arregloEstudiantes.map(
        function(valorActual,indice, arreglo){
        const nuevoObjeto = {
            id:valorActual.id,
            nombre:valorActual.nombre,
            nota: valorActual.nota,
            nota20:valorActual.nota*2
                            }
        return nuevoObjeto
                                            }
                                                );
    console.log(respuestaMap)
/////////////////////////////////////////////////////////////////////
    const respuestaFilter = arregloEstudiantes.filter(
        function(valorActual){
            const busqueda =! valorActual.nombre.search("jose");
            return busqueda
        }
    );
    console.log(respuestaFilter)
////////////////////////////////////////////////////////////////////////
    const respuestaSome = arregloEstudiantes.some(
        function(valorActual){
            const condicion = valorActual.nota < 7
            return condicion;
        }
    )
    console.log(respuestaSome)
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
const respuestaEvery = arregloEstudiantes.every(
    function(valorActual){
        const condicion = valorActual.nota < 7
        return condicion;
    }
)
console.log(respuestaEvery)
////////////////////////////////////////////////////////////////////
/*
reduce -> devuelve un valor con el calculo aplicado
enviamos -> calculo
devuelve -> valor
*/

const respuestaReduce = arregloEstudiantes.reduce(
    function(acumulador, valorActual){
        const calculo = acumulador + valorActual.nota;
        return calculo
    },0
);
console.log(respuestaReduce)




 const respuestaFilterNuestro = filter(arregloEstudiantes,
    function(valorActual, i, arr){
        console.log(valorActual);
        console.log(i);
        console.log(arr);
        return valorActual.nota >= 7;
    }
 );
 console.log(respuestaFilterNuestro)
 const respuestaEveryNuestro = every(arregloEstudiantes,
    function(valorActual, i, arr){
        console.log(valorActual);
        console.log(i);
        console.log(arr);
        return valorActual.nota > 1;
    }
    );
console.log(respuestaEveryNuestro)

const respuestaSomeNuestro = some(arregloEstudiantes,
    function(valorActual, i, arr){
        console.log(valorActual);
        console.log(i);
        console.log(arr);
        return valorActual.nota > 10;
    }
    );
console.log(respuestaSomeNuestro)

forEach(arregloEstudiantes,
    function(valorActual, indice, arreglo){
        console.log(valorActual.nota = valorActual.nota*2)
    }
);

console.log(arregloEstudiantes);*/
                }
main();