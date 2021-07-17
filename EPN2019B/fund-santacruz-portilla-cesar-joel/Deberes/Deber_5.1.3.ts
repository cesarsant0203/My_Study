const tipoEstatura = prompt(" Ingrese su estatura en cm ");
const estatura = Number(tipoEstatura);
if (estatura <= 140) {
    console.log("pequeno");
    } else {
    if (estatura > 140 && estatura <= 170) {
        console.log("promedio");
    } else {
        if (estatura > 170 && estatura <= 200 ) {
            console.log("alto");
            } else {
                    if (estatura > 200 ) {
                            console.log("estas loco hombre");
                            }
                    }
                }
            }