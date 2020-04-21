/*Crear un arrglo con 5 elementos
cada elemento va a ser un uno o un cero
Ej:[0,0,1,1,0]
exista al menos un elemento 1
Ej:[0,0,0,0,0] no valido
*/
/*var random = Math.floor(Math.random() * 2); // random number 0-1
const arreglo = [random, random, random, random, random];
console.log(arreglo);*/
const arreglo = [];
for (let tamanio = prompt("ingrese el tamanio del arreglo"); tamanio > 0; tamanio--) {
    arreglo.push(Math.floor(Math.random() * 2));
}
/*
let number = -1;
let suma = 0;
do {
    number = number + 1;
    suma = suma + arreglo[number];
} while (number < tamanio);

if (suma >= 1) {
    console.log(arreglo);
} else {
    console.log("hola")
}
*/

/*
1. Definir el numero de jugadoresPrimerobundleRenderer.
2. Asignar a los jugadores que tendran el floron y los que no
3. Verificar que almenos un jugador tenga el floron
4. Adividar donde esta el floron
tenemos el arreglo con n posiciones iniciamos con la posicion 0
generamos un indice de 0 a 9 que sea randomico y a ese le asignamos el 1
*/