const arregloNumeros = [1, 2, 3, 4, 5, 9, 7, 8, 9, 10];


//Acceder
// Necesito el indice
console.log(arregloNumeros[6]); //7


//Anadir al final
//Necesito: Elemento a anadirse
arregloNumeros.push(11);



//Borrar al final
arregloNumeros.pop();




//Anadir 
//Necesito:     indice
//              elemento
arregloNumeros.splice(1, 0, 1.2);
console.log(arregloNumeros);




//borrar
arregloNumeros.splice(7, 1, );
console.log(arregloNumeros);

//Buscar el indice de un elemento
console.log(arregloNumeros);

arregloNumeros.indexOf(9); // ??

console.log(arregloNumeros);

arregloNumeros[0] = 999;



























/*
Pseudocodigo
insertamos un arreglo
Ingresamos el indice
vamos sacando y guardando cada elemento hasta el del indice
anadimos un elemnto en este lugar
vamos anadiendo cada elemento que sacamos
imprimimos el nuevo indice
Programar el splice con un elemento para anadir y borrar