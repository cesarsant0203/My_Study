
export function every(arreglo: any[],
    funcion: (valorActual:any, indice?:number,arreglo?:any[]) => boolean): boolean{
    const funEvery = true;
    for( let i = 0; i < arreglo.length; i++){
        const respuestaFuncion = funcion(
            arreglo[i],
            i,
            arreglo,
        );
        if(respuestaFuncion == false){
        return false;
        }
    }
    return funEvery;
}
