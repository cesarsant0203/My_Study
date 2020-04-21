var number = 0;
var compiladores = 0;
var analisis = 0;
var algebra = 0;
var fisica = 0;
var calculo = 0;
var fundamentos = 0;
do {
    number = number + 1;
    if (number % 11 == 0) {
        fisica = fisica + 1;
    }
    else {
        if (number % 7 == 0) {
            calculo = calculo + 1;
        }
        else {
            if (number % 5 == 0) {
                fundamentos = fundamentos + 1;
            }
            else {
                if (number % 3 == 0) {
                    compiladores = compiladores + 1;
                }
                else {
                    if (number % 2 == 0) {
                        algebra = algebra + 1;
                    }
                    else {
                        if (number % 2 == 1) {
                            analisis = analisis + 1;
                        }
                    }
                }
            }
        }
    }
} while (number < 1000);
console.log(compiladores);
console.log(analisis);
console.log(algebra);
console.log(fisica);
console.log(calculo);
console.log(fundamentos);
