
export function map(arregloOriginal: any[],
    funcion: (valorActual:any, indice?:number,arreglo?:any[]) => any[]): any{
        let funMap = [];
        const arreglo = [...arregloOriginal];
        for( let i = 0; i < arreglo.length; i++){
        const respuestaFuncion = funcion(
            arreglo[i],
            i,
            [...arreglo],
        );
        funMap.push(respuestaFuncion)
    }
    return funMap
}
