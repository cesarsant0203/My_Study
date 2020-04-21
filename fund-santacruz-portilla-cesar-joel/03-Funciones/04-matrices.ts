const arregloMatriz = [
    [1,2],
    [3,4,5],
    [6,7,8],
    [9],
]
function compararMatriz(
    matrizUno: number [][],
    matrizDos: number [][]
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
    return true;
}

function obtenerPrimeraDimension(matrizUno: number [][]): number | boolean{//use | para anadir mas tipos
    //validaciones
    const esValido = verificarTodosLosElementosDeUnArregloSonarreglo(matrizUno);
    if(esValido){
        const primeraDimensionArreglo = matrizUno.length;
        return primeraDimensionArreglo;
    }else{
        return false;
    }
}

function obtenerSegundaDimension(matrizUno: number [][]): number | boolean{
    const esValido = verificarTodosLosElementosDeUnArregloSonarreglo(matrizUno);
    if(esValido){
    let longitudActualMax = 0; // auxiliar
    let longitudActualMin = -1; //auxiliar
    for(let i = 0; i < matrizUno.length; i++){
        const elementoActual = matrizUno[i]; //arreglo
        const longitudActual = elementoActual.length; //segunda dimension
        if(longitudActualMax < longitudActual){
            longitudActualMax = longitudActual;
        }
        if(longitudActualMin == -1){
            longitudActualMin = longitudActual;
        }else{
            if(longitudActual < longitudActualMin){
                longitudActualMin = longitudActual
            }
        }
    }
    if(longitudActualMax != longitudActualMin){
        return false;
    }else{
        return matrizUno[0].length;
        }
    }else{
    return false
    }
}
//usar funcion para ver si es arreglo

function verificarTodosLosElementosDeUnArregloSonarreglo (arreglo: any[]
    ):boolean{
    for(let i = 0 ; i < arreglo.length; i++){
        const elementoActual = arreglo[i];
        const esUnArreglo = typeof elementoActual == 'object' &&
        elementoActual.indexOf; // truty
        if(!esUnArreglo){
            alert("No es un arreglo");
            return false;
        }
    }
    return true;
}

function main(){
    const matrizUno = [
        [1,2],
        [3]
    ];
    const matrizDos = [
        [1,2],
        [3,4],
    ];
    compararMatriz(matrizUno, matrizDos);
}