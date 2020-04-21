import { shuffle } from './02-shuffle'
import * as readline from 'readline';


//////////////////////////////////////////////
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 0];
const arrO = [1, 2, 3, 4, 5, 6, 7, 8, 0];
arr = shuffle(arr);
let arrOneOne =   (arr[0]);
let arrOneTwo =   (arr[1]);
let arrOneThree = (arr[2]);
let arrTwoOne =   (arr[3]);
let arrTwoTwo =   (arr[4]);
let arrTwoThree = (arr[5]);
let arrThreeOne = (arr[6]);
let arrThreeTwo = (arr[7]);
let arrThreeT =   (arr[8]);
let arrOOneOne =   (arrO[0]);
let arrOOneTwo =   (arrO[1]);
let arrOOneThree = (arrO[2]);
let arrOTwoOne =   (arrO[3]);
let arrOTwoTwo =   (arrO[4]);
let arrOTwoThree = (arrO[5]);
let arrOThreeOne = (arrO[6]);
let arrOThreeTwo = (arrO[7]);
let arrOThreeT =   (arrO[8]);

//////////////////////////////////////////////

console.log('\t \t \t -------------Que comience el juego------------- \t \t \t \t \n \t \t \t Seleccione la posicion que desea mover y a donde desea mover \n \t \t \t \t \t POSICIONES \t \t \t \t \t ')
console.log('DEBES LLEGAR A ESTO');
console.log(arrOOneOne, arrOOneTwo, arrOOneThree);
console.log(arrOTwoOne,arrOTwoTwo, arrOTwoThree);
console.log(arrOThreeOne, arrOThreeTwo, arrOThreeT);
console.log('ESTAS AQUI');
console.log(arrOneOne, arrOneTwo, arrOneThree);
console.log(arrTwoOne,arrTwoTwo, arrTwoThree);
console.log(arrThreeOne, arrThreeTwo, arrThreeT);



if (
  (arrOneOne == arrOOneOne) && 
  (arrOneTwo == arrOOneTwo) && 
  (arrOneThree == arrOOneThree) && 
  (arrTwoOne == arrTwoOne) && 
  (arrTwoTwo == arrOOneTwo) && 
  (arrTwoThree == arrOOneThree) && 
  (arrThreeOne == arrOOneOne) && 
  (arrTwoTwo == arrOOneTwo) && 
  (arrThreeT == arrOOneThree) && 
  ){
  console.log('GANASTE');
}else{
  console.log('perdiste');
}
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