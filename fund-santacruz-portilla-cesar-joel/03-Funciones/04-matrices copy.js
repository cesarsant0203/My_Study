function compararMatriz(matrizUno, matrizDos) {
    var matrizUnoPrimeraDimension = obtenerPrimeraDimension(matrizUno);
    var matrizUnoSegundaDimension = obtenerSegundaDimension(matrizUno);
    var matrizDosPrimeraDimension = obtenerPrimeraDimension(matrizDos);
    var matrizDosSegundaDimension = obtenerSegundaDimension(matrizDos);
    console.log(matrizUnoPrimeraDimension);
    console.log(matrizUnoSegundaDimension);
    console.log(matrizDosPrimeraDimension);
    console.log(matrizDosSegundaDimension);

    var noHayFalsos = matrizUnoPrimeraDimension != false &&
        matrizUnoSegundaDimension != false &&
        matrizDosPrimeraDimension != false &&
        matrizDosSegundaDimension != false
    if ( noHayFalsos ){
        const tieneIgualDimension = matrizUnoPrimeraDimension == matrizDosPrimeraDimension &&
        matrizUnoSegundaDimension == matrizDosSegundaDimension
        if (tieneIgualDimension)
            return tienenMismosValores(
                matrizUno,
                matrizDos);
    }else{
        return false;
    }
}
function tienenMismosValores ( ){
        var primeraDimension = matrizUno.length;
        var segundaDimension = matrizUno[0].length;
        var banderaSonIguales = true;
        for(let i = 0; i< primeraDimension; i++){
           for( let j = 0; j< segundaDimension; j++){
               const valorActualM1 = matrizUno[i][j];
               const valorActualM2 = matrizDos[i][j];
               if(valorActualM1 != valorActualM2){
                   banderaSonIguales = false;
               }
           }
        }
        return banderaSonIguales;
    }

function obtenerPrimeraDimension(matrizUno) {
    // VALIDACIONES
    var esValido = verificarTodosLosElementosDeUnArregloSonArreglo(matrizUno);
    if (esValido) {
        var primeraDimensionArreglo = matrizUno.length;
        return primeraDimensionArreglo;
    } else {
        return false;
    }
}

function obtenerSegundaDimension(matrizUno) {
    var esValido = verificarTodosLosElementosDeUnArregloSonArreglo(matrizUno);
    if (esValido) {
        var longitudActualMaxima = 0; // Auxiliar
        var longitudActualMinima = -1; // Auxiliar
        for (var i = 0; i < matrizUno.length; i++) {
            var elementoActual = matrizUno[i]; // arreglo
            var longitudActual = elementoActual.length; // segunda dimension
            if (longitudActualMaxima < longitudActual) {
                longitudActualMaxima = longitudActual;
            }
            if (longitudActualMinima == -1) {
                longitudActualMinima = longitudActual;
            } else {
                if (longitudActual < longitudActualMinima) {
                    longitudActualMinima = longitudActual;
                }
            }
        }
        if (longitudActualMaxima != longitudActualMinima) {
            return false;
        } else {
            return matrizUno[0].length;
        }
    } else {
        return false;
    }
}

function verificarTodosLosElementosDeUnArregloSonArreglo(arreglo) {
    for (var i = 0; i < arreglo.length; i++) {
        var elementoActual = arreglo[i];
        var esUnArreglo = typeof elementoActual == 'object' &&
            elementoActual.indexOf; // Truty
        if (!esUnArreglo) {
            return false;
        }
    }
    return true;
}

function main() {
    var x = [
        [1, 2],
        [3, 2]
    ];
    var y = [
        [1, 2],
        [3, 4],
    ];

    const resultado = compararMatriz(matrizUno, matrizDos)
    console.log(resultado);
}
main();