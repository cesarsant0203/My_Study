const casado = true;
//const casadoymosero = estacasado == true && tengomosa == true;
const estacasado = casado ==true;
//const soymosero = tengomosa == true;


if (casado == false){
    console.log("no estoy casado");
} else {
    console.log("si estoy casado");
}

if (casado == true){ //(expresion => boolean)
    console.log("si estoy casado");
} else {
    console.log("no estoy casado");
}
// ! es no
if (casado != true){ //(expresion => boolean)
    console.log("no estoy casado");
} else {
    console.log("si estoy casado");
}



/*if (casado == true && tengomosa == true) {
    console.log('casado y mosero');
}else{
    console.log("o casado o mosero o nada");
}
*/

/*
if(casadoymosero){
    console.log('casado y mosero');
}else{
    console.log("o casado o mosero o nada");
}
*/
//AND -> &&
//TRUE Y TRUE = TRUE
//TRUE Y FALSE = FALSE
//FALSE Y TRUE = FALSE
//FALSE Y FALSE = FALSE
//OR||
//TRUE Y TRUE = TRUE
//TRUE Y FALSE = TRUE
//FALSE Y TRUE = TRUE
//AND|
//FALSE Y FALSE = FALSE
//TRUE Y TRUE = TRUE
//TRUE Y FALSE = FALSE
//FALSE Y TRUE = FALSE
//FALSE Y FALSE = TRUE
//AND
//TRUE Y TRUE = TRUE
//TRUE Y FALSE = FALSE
//FALSE Y TRUE = FALSE
//FALSE Y FALSE = TRUE
/*
apago la primera alarma me hago bolita y llorro hasta la segunda alarma y me levanto
celulardescargado == true
celulardanado == true
amanecemuerto == true
estaactivadalaalarma !=true
estaenmodosilencio == true
*/
const celulardanado = true;
const celulardescargado = false;
const estaenmodosilencio = true;
const amanecemuerto = true;
const estaactivadalaalarma = false;
const seatrasoaclase = celulardescargado == true || celulardanado == true || amanecemuerto == true || estaactivadalaalarma !=true || estaenmodosilencio == true;
if(seatrasoaclase){
    console.log('se atraso a clase');
}else{
    console.log("esta llorando hecho bolita");
}

/*
si number1 add number2 entonces sumar caso contrario 
si number1 subtract number2 entoces restar caso contrario
 si number1 multiply number2 entonces multiplica caso contario 
 si number1 divide number2 entonces divide caso contrario
  si number1,number2 redious entonces numer1 multiply number1 multiply pi caso contrarrio
   que diablos haces aqui
/*
si el celular esta desacragado o 
el celular esta danado o 
amanece muerto o 
no esta activada la alarma o
esta en modo silencio o 
se atraso a clase
caso contrario 
esta llorando hecho bolita*/

//truty
const nombreVacio = "";
if (nombreVacio){
    console.log("truty")
}else{
    console.log("falsy")
}//falsy

const nombreVacio = "";
if ("ndsadasda"){
    console.log("truty")
}else{
    console.log("falsy")
}//truty

const nombreVacio = "";
if (nombreVacio){
    console.log("truty")
}else{
    console.log("falsy")
}//falsy

const nombreVacio = "";
if (-4){
    console.log("truty")
}else{
    console.log("falsy")
}//truty

if (4){
    console.log("truty")
}else{
    console.log("falsy")
}//truty

if (1.2){
    console.log("truty")
}else{
    console.log("falsy")
}//truty

if (0){
    console.log("truty")
}else{
    console.log("falsy")
}//falsy
