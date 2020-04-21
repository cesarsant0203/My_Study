//"use strict";

//exports.__esModule = true

var sumaLibrerias = require('libreria-cssu/lib/suma');
var resultado1 = sumaLibrerias(1, 2);
console.log('el resultado de la suma es:', resultado1);

var restaLibrerias = require('libreria-cssu/lib/resta');
var resultado2 = restaLibrerias(1, 2);
console.log('el resultado de la resta es:', resultado2);

var multiplicacionLibrerias = require('libreria-cssu/lib/multiplicacion');
var resultado3 = multiplicacionLibrerias(1213, 2);
console.log('el resultado de la multiplicacion es:', resultado3);

var divisionLibrerias = require('libreria-cssu/lib/Division');
var resultado4 = divisionLibrerias(4, 2);
console.log('el resultado de la division es:', resultado4);

var areaTLibrerias = require('libreria-cssu/lib/area-triangulo');
var resultado5 = areaTLibrerias(1215345, 424);
console.log('el area del triangulo es:', resultado5);

var areaCLibrerias = require('libreria-cssu/lib/area circulo');
var resultado6 = areaCLibrerias(1, 2);
console.log('el area del circulo es:', resultado6);

var anguloTLibrerias = require('libreria-cssu/lib/angulo-triangulo');
var resultado7 = anguloTLibrerias(180, 10);
console.log('el angulo restante es:', resultado7);

var PI = require('libreria-cssu/lib/pi')
console.log('la constante pi es', PI);