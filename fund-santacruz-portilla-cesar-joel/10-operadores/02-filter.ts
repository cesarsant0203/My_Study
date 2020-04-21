export function restar(numUno,numDos){
    return numUno - numDos
}
export function sumar(numUno,numDos){
    return numUno + numDos
}
export function calcular(funcion, numUno,numDos){
    const valorInicial = 10
    return funcion(numUno,numDos, valorInicial)
}
export function filter(arreglo: any[], funcion: (valorActual:any, indice?:number,arreglo?:any[]) => boolean): any[]{
    const arregloFiltrado = [];
    for( let i = 0; i < arreglo.length; i++){
        const respuestaFuncion = funcion(
            arreglo[i],
            i,
            arreglo,
        );
        if(respuestaFuncion == true){
        arregloFiltrado.push(arreglo[i]);
        }
    }
    return arregloFiltrado;
}
console.log(calcular(sumar,1,2)); // 3
console.log(calcular(restar,5,2)); // 3
