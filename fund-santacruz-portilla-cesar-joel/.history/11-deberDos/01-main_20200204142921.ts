import { shuffle } from './02-shuffle'
import * as prompts from "prompts"
import { opcionInterface } from './interfaces/opcion.interface';
import { funcionOpcion } from './03-opcion';


//////////////////////////////////////////////
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 0];
const arrO = [1, 2, 3, 4, 5, 6, 7, 8, 0];
//arr = shuffle(arr);
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
async function main(){
  

console.log('\t \t \t -------------Que comience el juego------------- \t \t \t \t \n \t \t \t Seleccione la posicion que desea mover y a donde desea mover \n \t \t \t \t \t POSICIONES \t \t \t \t \t ')
console.log('DEBES LLEGAR A ESTO');
console.log(arrOOneOne, arrOOneTwo, arrOOneThree);
console.log(arrOTwoOne,arrOTwoTwo, arrOTwoThree);
console.log(arrOThreeOne, arrOThreeTwo, arrOThreeT);
console.log('ESTAS AQUI');
console.log(arrOneOne, arrOneTwo, arrOneThree);
console.log(arrTwoOne,arrTwoTwo, arrTwoThree);
console.log(arrThreeOne, arrThreeTwo, arrThreeT);

all();

}
main();

async function all(){
if (
  (arrOneOne == arrOOneOne) && (arrOneTwo == arrOOneTwo) && (arrOneThree == arrOOneThree) && (arrTwoOne == arrTwoOne) && (arrTwoTwo == arrTwoTwo) && (arrTwoThree == arrTwoThree) && (arrThreeOne == arrThreeOne ) && (arrThreeTwo == arrThreeTwo) &&
  (arrThreeT == arrThreeT)){
  console.log('GANASTE');
}else{
  let movimiento = await funcionOpcion()
  if ((movimiento == 12) && (arrOneTwo == 0) ){
    arrOneTwo = await arrOneTwo + arrOneOne;
    arrOneOne = await arrOneOne - arrOneOne;
  }else{
    if ((movimiento == 14) && (arrTwoOne == 0) ){
      arrTwoOne = await arrTwoOne + arrOneOne;
      arrOneOne = await arrOneOne - arrOneOne;
    }else{
      if ((movimiento == 21) && (arrOneOne == 0) ){
        arrOneOne = await arrOneOne + arrOneTwo;
        arrOneTwo = await arrOneTwo - arrOneTwo;
      }else{
        if ((movimiento == 23) && (arrOneThree == 0) ){
          arrOneThree = await arrOneThree + arrOneTwo;
          arrOneTwo = await arrOneTwo - arrOneTwo;
        }else{
          if ((movimiento == 25) && (arrTwoTwo == 0) ){
            arrTwoTwo = await arrTwoTwo + arrOneTwo;
            arrOneTwo = await arrOneTwo - arrOneTwo;
        }else{
          if ((movimiento == 32) && (arrOneTwo == 0) ){
            arrOneTwo = await arrOneTwo + arrOneThree;
            arrOneThree = await arrOneThree - arrOneThree;
          }else{
            if ((movimiento == 36) && (arrTwoThree == 0) ){
              arrTwoThree = await arrOneTwo + arrOneThree;
              arrOneThree = await arrOneThree - arrOneThree;
    }
}
}
/*
if ((movimiento == 12) && (arrOneTwo != 0)){
    console.log('no se puede hacer este movimiento')
    }else{
      all();
let posicion1 = 1;
let posicion2 = 2;
let posicion3 = 3;
let posicion4 = 4;
let posicion5 = 5;
let posicion6 = 6;
let posicion7 = 7;
let posicion8 = 8;
let posicion9 = 0;


// Used like so


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