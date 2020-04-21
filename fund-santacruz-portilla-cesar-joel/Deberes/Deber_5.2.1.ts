const tipoFruta = prompt("ingrese la fruta a consumir");
const fruta01 = "naranjas";
const fruta02 = "papayas";
const fruta03 = "mangos";
switch (tipoFruta) {
  case 'naranjas':
    console.log('Las naranjas estan a 0.89$ la libra.');
    break;
  case 'mangos':
  case 'papayas':
    console.log('mangos y papayas estan a 2.87$ la libra.');
    break;
  default:
    console.log('Lo siento estamos sin ' + tipoFruta + '.');
}