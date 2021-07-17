// NUMEROUNO -> TODO MAYUSCULA
//NUMERO_UNO -> mayusculas guion bajp
//NumeroUno -> 
//numerouno ->
//numero_uno -> python
//umerOunO
const numeroUno = 1;
const numeroDos = 2;
let result = 0;
//SUMA
result =1 + 2;
//RESTAR
result =1 * 2;
//multiplicar
result =1 * 2;
//dividir
result =1 / 2;
//exppnencial
result =1 ^ 2;
//mod
result = 4 % 2; //0
result = 7 % 3; //1
console.log("pera" + 2);

function add (a, b) {
    return Math.abs(a + b);
  }
//add

  console.log(add(3, 5));
  
  console.log(add(5, 3));
  
  console.log(add(1.23456, 7.89012));
  
//difference

function difference(a, b) {
    return Math.abs(a - b);
  }
  
  console.log(difference(3, 5));
  
  console.log(difference(5, 3));
  
  console.log(difference(1.23456, 7.89012));
  

//STRINGS
const mensaje = '\"Hola mundo\"';
const saludo = '"Adio\s mundo"';
console.log(mensaje +'\t' + saludo);
//Template string
const edad = '19';
const saludoEdad = `Mi edad es: ${edad}`;
console.log (saludoEdad);
const saludocompleto = `esto quiero decir: \n${mensaje}\n${saludo}`
console.log(saludocompleto)
//Contamos los elementos

const NombreLongutud = "Cesar Joel Santacruz Portilla";
console.log(NombreLongutud.length);
//Eliminar espacios al inicio y al final
console.log(NombreLongutud.trim());
console.log(NombreLongutud.toUpperCase());
console.log(NombreLongutud.length);
console.log(NombreLongutud.replace( "a", "o"));
console.log(NombreLongutud.replace( "b", "o"));
console.log(NombreLongutud.replace( "c", "o"));
console.log(NombreLongutud.search("Cesar"));