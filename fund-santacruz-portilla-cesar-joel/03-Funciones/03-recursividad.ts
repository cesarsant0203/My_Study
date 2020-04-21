/*function imprimirMensajeNVeces( mensaje:string, numeroVeces: number): void{
        if(numeroVeces == 0){
            console.log('se termino');
        }else{
            console.log(mensaje);
            const nuevoNumeroVeces = numeroVeces -1;
            imprimirMensajeNVeces(mensaje, nuevoNumeroVeces );

        }
}

function main (){
    imprimirMensajeNVeces(':3',12)
}
main();
*/
//funcion 2

const arregloNumeros = [1, 2, 3, 4, 5, 9, 7, 8, 9, 10];

function buscarenArreglo(arreglo: number[], i: number) {
    let arreglo == arregloNumero=[];
    if (i == 0) {
        console.log('se termino');
    } else {
        console.log(arreglo);
        var nuevoIndice = i - 1;
        buscarenArreglo(arreglo, nuevoIndice);
    }
}

function main() {
    buscarenArreglo(arreglo, 9);
}
main();








//const arregloNumeros: number[] = []


