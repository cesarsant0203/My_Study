//existen dos tipos el while y el do-while
/*DO WHILE*/
let vecesQueHeComido = 0;
do{
    console.log('vamos a comer');
    vecesQueHeComido = vecesQueHeComido +1;
    switch(vecesQueHeComido){
        case 1:
            console.log('desayuno');
        break;
        case 2:
            console.log('almuerzo');
        break;
        case 3:
            console.log('merienda')
        default:
            console.log('gorditos')
    }
} while(vecesQueHeComido < 3)

/*
1 mecanica
2 vectorial
3 EDO
5 Programacion
7 Compiladores
1 1ingles
si es impar le aumentamos a analisis socioeconomico
si es par aumentamos a algebra
si es multiplo de 3 a compiladores
*