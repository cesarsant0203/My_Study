export function reduce(arreglo:any[],
     funcion: (contador:number,
        valorActual:any,indice: number, arreglo) =>number, contador:number):number
{
    for(let i = 0; i < arreglo.length; i ++){
        contador = funcion(contador, arreglo[i], i, arreglo);
    }
    return contador;
}