//existen dos tipos el while y el do-while
/*DO WHILE*/
var vecesQueHeComido = 0;
do {
    console.log('vamos a comer');
    vecesQueHeComido = vecesQueHeComido + 1;
    switch (vecesQueHeComido) {
        case 1:
            console.log('desayuno');
            break;
        case 2:
            console.log('almuerzo');
            break;
        case 3:
            console.log('merienda');
        default:
            console.log('gorditos');
    }
} while (vecesQueHeComido < 3);
