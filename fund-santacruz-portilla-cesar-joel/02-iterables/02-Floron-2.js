const arreglo = [];
let tamanio = prompt("ingrese el tamanio del arreglo")
for (tamanio = tamanio; tamanio > 0; tamanio--) {
    arreglo.push(0);
}
let puesto = /*arreglo.push*/ (Math.floor(Math.random() * tamanio));
arreglo[puesto] = 1;

console.log(arreglo);