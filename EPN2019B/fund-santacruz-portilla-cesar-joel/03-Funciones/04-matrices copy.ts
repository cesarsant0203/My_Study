const arregloMatriz = [
    [1,2],
    [3,4,5],
    [6,7,8,6],
    [9],
    [],
];



function compararMatriz(
    matrizUno: number[][],
    matrizDos: number[][]
): boolean {
    const matrizUnoPrimeraDimension = obtenerPrimeraDimension(
        matrizUno
        );
    const matrizUnoSegundaDimension = obtenerSegundaDimension(
        matrizUno
        );
    const matrizDosPrimeraDimension = obtenerPrimeraDimension(
        matrizDos
        );
    const matrizDosSegundaDimension = obtenerSegundaDimension(
        matrizDos
        );
    console.log(matrizUnoPrimeraDimension);
    console.log(matrizUnoSegundaDimension);
    console.log(matrizDosPrimeraDimension);
    console.log(matrizDosSegundaDimension);
    
 return true;
}

function obtenerPrimeraDimension(matrizUno: number[][]): number | boolean{
    // VALIDACIONES
    const esValido = verificarTodosLosElementosDeUnArregloSonArreglo(matrizUno);
    if(esValido){
        const primeraDimensionArreglo = matrizUno.length;
        return primeraDimensionArreglo;
    }else{
        return false;
    }
}

function obtenerSegundaDimension(matrizUno: number[][]): number | boolean{
    const esValido = verificarTodosLosElementosDeUnArregloSonArreglo(matrizUno);
    if(esValido){
        let longitudActualMaxima = 0; // Auxiliar
        let longitudActualMinima = -1; // Auxiliar
        for(let i = 0; i < matrizUno.length; i++){
            const elementoActual = matrizUno[i]; // arreglo
            const longitudActual = elementoActual.length; // segunda dimension
            if(longitudActualMaxima < longitudActual){
                longitudActualMaxima = longitudActual;
            }
            if(longitudActualMinima == -1) {
                longitudActualMinima = longitudActual;
            }else{
                if(longitudActual < longitudActualMinima){
                    longitudActualMinima = longitudActual;
                }
            }
        }
        if(longitudActualMaxima != longitudActualMinima){
            return false;
        }else{
            return matrizUno[0].length;
        }
    }else{
        return false;
    }
}

function verificarTodosLosElementosDeUnArregloSonArreglo(
    arreglo: any[]
):boolean{
    for(let i = 0; i < arreglo.length; i++){
        const elementoActual = arreglo[i];
        const esUnArreglo = typeof elementoActual == 'object' &&
        elementoActual.indexOf; // Truty
        if(!esUnArreglo){
            return false;
        }
    }
    return true;
}


function main(){
    const x = [
        [1,2],
        [3]
    ];
    const y = [
        [1,2],
        [3,4],
    ];
    compararMatriz(x, y);
}
main();