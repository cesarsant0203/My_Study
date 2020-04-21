/*for
1- declarar una variable
2- condicion
3- incrementar o disminuir
*/
for (let numeroEx = 7; numeroEx != 0; numeroEx--) {
    console.log('ES CAN DA LO!', numeroEx);
}

for (let numeroExEs = 1; numeroExEs <= 7; numeroExEs++) {
    console.log('K.O!', numeroExEs);
}

for (let numeroExDe = 0; numeroExDe <= 6; numeroExDe++) {
    console.log('denuncia', numeroExDe);
}

/*
Arreglos
De un elemento Elemento
Conjunto de elementos ([1,2,3,4,5])
Conjunto de diferentes elementos ([1, true,'abc'])
*/

const arregloDeNumeros = [1, 2, 3, 4, 5];
//Reasignar
arregloDeNumeros.push(6);
console.log(arregloDeNumeros);

arregloDeNumeros.pop();
console.log(arregloDeNumeros);
/*
Arreglo
1-Elementos
2-Posicion o Indices (0 index based)
3- Longitud
*/
console.log(arregloDeNumeros.length);
/*
For
let tamano = arregloDeNumeros.length //5
tamano <= arregloDeNumeros.length
*/
/*for (let tamano = arregloDeNumeros.length; tamano <= arregloDeNumeros.length; tamano++) {
    console.log(tamano);
}
*/
//acceder a acada elelmento del arreglo por el indice
const indiceElementoUno = 0;
arregloDeNumeros[indiceElementoUno]; //1
const indiceElementoCinco = 4;
arregloDeNumeros[indiceElementoCinco]; //5

//acceder al elemento 5
//indice
console.log(arregloDeNumeros[indiceElementoCinco]);

/*Crear un arrglo con 5 elementos
cada elemento va a ser un uno o un cero
Ej:[0,0,1,1,0]
exista al menos un elemento 1
Ej:[0,0,0,0,0] no valido
*/