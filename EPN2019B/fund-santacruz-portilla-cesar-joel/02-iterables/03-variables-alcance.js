let edad = 30;
if (edad > 18) {
    console.log(edad);
    console.log("legal");
} else {
    console.log("7 anios de carcel");
}

if (true) { //bloque 1
    let edad = 30;
    console.log(edad);
    if (edad) {
        bloque 2
        console.log(edad);
        if (edad) { //bloque 3
            console.log(edad);
        } else { //bloque 4
            console.log(edad);
        }
    } else { //bloque 5
        console.log(edad);
    }
} else { //bloque 6
}

/*
con un if se crea un bloque de codigo y con el else se crea otro bloque mas pero en el bloque mas grande va a estar todo
pasaporte = 1
*/

for (let 1 = 0; 1 < 10; i++) {
    let bandera = 0
    bandera = bandera + 1
}
console.log(bandera);


let arreglofloron = [0, 0, 0, 0, 1];
let existeFloron = false;
for (let i = 0; i < 5; i++) {
    if (arreglofloron[i] == 1) {
        existeFloron = true;

    } else {
        existeFloron = false;
    }
}

if (existeFloron) {
    console.log("adivinar");
} else {
    console.log * ("asignar y luego adivinar")
}
