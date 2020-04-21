import { shuffle } from './02-shuffle'
import * as readline from 'readline';


//////////////////////////////////////////////
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 0];
let arrOne = arr[0], arr[1] ,arr[2];
//////////////////////////////////////////////

console.log('\t \t \t -------------Que comience el juego------------- \t \t \t \t \n \t \t \t Seleccione la posicion que desea mover y a donde desea mover \n \t \t \t POSICIONES \t \t \t \n \t \t \t 1 2 3 \t \t \t \n \t \t \t 4 5 6 \t \t \t \n \t \t \t 7 8 9 \t \t \t \n')
arr = shuffle(arr);
console.log(arrOne);
console.log(arr[3],arr[4],arr[5]);
console.log(arr[6],arr[7],arr[8]);

/*
let rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('es wong maricon ', (answer) => {
  switch(answer.toLowerCase()) {
    case 'y':
      console.log('Super!');
      break;
    case 'n':
      console.log('Sorry! :(');
      break;
    default:
      console.log('Invalid answer!');
  }
  rl.close();
});

let posicion1 = 1;
let posicion2 = 2;
let posicion3 = 3;
let posicion4 = 4;
let posicion5 = 5;
let posicion6 = 6;
let posicion7 = 7;
let posicion8 = 8;
let posicion9 = 0;
*/

// Used like so

/*
function iniciar(){
    console.log(posicion1,posicion2,posicion3);
    console.log(posicion4,posicion5,posicion6);
    console.log(posicion8,posicion7,posicion9);
}
    function main(){
      iniciar();
      if
}
main();
*/