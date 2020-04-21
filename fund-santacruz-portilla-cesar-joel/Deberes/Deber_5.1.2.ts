const dieta = prompt(" Ingrese el alimento que va a consumir ");
const operacion03 = "vegetales";
const operacion04 = "carnes";
const operacion05 = "lacteos";
if (dieta == operacion03) {
    const cantidadString = prompt(" Ingrese cantidad gr ");
    const cantidad = Number(cantidadString);
    if (cantidad >= 400) {
    console.log("Bueno para la salud");
    } else {
        console.log("debes consumir mas")
    }
} else {
    if (dieta == operacion04) {
        const cantidadString = prompt(" Ingrese cantidad gr ");
        const cantidad = Number(cantidadString);
        if (cantidad >= 200 && cantidad <= 700 ) {
            console.log("Bueno para la salud");
            } else {
                    if (dieta == operacion05) {
                        const cantidadString = prompt(" Ingrese cantidad gr ");
                        const cantidad = Number(cantidadString);
                        if (cantidad <= 100 ) {
                            console.log("Bueno para la salud");
                            } else {
                                console.log("no es necesario")
                            } 
                    }
                }
            }
        }