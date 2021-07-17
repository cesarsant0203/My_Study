var casado = true;
//const casadoymosero = estacasado == true && tengomosa == true;
var estacasado = casado == true;
//const soymosero = tengomosa == true;
if (casado == false) {
    console.log("no estoy casado");
}
else {
    console.log("si estoy casado");
}
if (casado == true) {
    console.log("si estoy casado");
}
else {
    console.log("no estoy casado");
}
// ! es no
if (casado != true) {
    console.log("no estoy casado");
}
else {
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
var celulardanado = true;
var celulardescargado = false;
var estaenmodosilencio = true;
var amanecemuerto = true;
var estaactivadalaalarma = false;
var seatrasoaclase = celulardescargado == true || celulardanado == true || amanecemuerto == true || estaactivadalaalarma != true || estaenmodosilencio == true;
if (seatrasoaclase) {
    console.log('se atraso a clase');
}
else {
    console.log("esta llorando hecho bolita");
}
/*
si el celular esta desacragado o
el celular esta danado o
amanece muerto o
no esta activada la alarma o
esta en modo silencio o
se atraso a clase
caso contrario
esta llorando hecho bolita*/ 
