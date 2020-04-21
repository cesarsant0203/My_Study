function log(
    cualquierCosa //parametro
) {
    console.log(cualquierCosa)
}
log("Hola Mundo"); // agarra el paramatro(lo que esta dentro del parentesis)y la manda a la funcion
/*
todo lo que hagamos tendra
+entradas

+proceso

+salida

Cuando el proceso no tiene salida se lo llama VOID,
y a las entradas se las llama parametros
En el proceso esta las lineas de codigo
Se puede mandar funciones sin aparametro, estas no devolveran nada
*/

function sumarDosNumeros(
    a:number,
    b:number
){
    return a + b;
}
sumarDosNumeros (4, 2);

function sumarDosNumeros(
    a:number,
    b:number
) : number {
    return a + b;
}
sumarDosNumeros (4, 2);

/* Existen lenguajes como PHP, PYthon, JavaScript que no son tipados*/
