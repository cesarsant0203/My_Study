const tipoTerreno = prompt(" Ingrese el tipo de terreno ");
const operacion01 = "circular";
const operacion02 = "rectangular";
if (tipoTerreno == operacion01) {
    const radioString = prompt(" Ingrese radio ");
    const radio = Number(radioString);
    const circulo = radio * 3.14159 * 3.14159;
    console.log(circulo);
} else {
    if (tipoTerreno == operacion02) {
        const baseString = prompt(" ingrese base ");
        const alturaString = prompt(" Ingrese altura ");
        const base = Number(baseString);
        const altura = Number(alturaString);
        const rectangular = base * altura;
        console.log(rectangular);
                } else {
                    console.log("math error");
                    }
            }