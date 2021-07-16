const tipoOperacion = prompt(" Ingrese el tipo de operacion ");
const operacion01 = "suma";
const operacion02 = "resta";
const operacion03 = "multipicación";
const operacion04 = "división";
const operacion05 = "desplazamiento";
if (tipoOperacion == operacion01) {
    const numeroUnoString = prompt(" Ingrese valor uno ");
    const numeroDosString = prompt(" Ingrese valor dos ");
    const numeroUno = Number(numeroUnoString);
    const numeroDos = Number(numeroDosString);
    const suma = numeroUno + numeroDos;
    console.log(suma);
} else {
    if (tipoOperacion == operacion02) {
        const numeroUnoString = prompt(" Ingrese valor uno ");
        const numeroDosString = prompt(" Ingrese valor dos ");
        const numeroUno = Number(numeroUnoString);
        const numeroDos = Number(numeroDosString);
        const resta = numeroUno - numeroDos;
        console.log(resta);
    } else {
        if (tipoOperacion == operacion03) {
            const numeroUnoString = prompt(" Ingrese valor uno ");
            const numeroDosString = prompt(" Ingrese valor dos ");
            const numeroUno = Number(numeroUnoString);
            const numeroDos = Number(numeroDosString);
            const multiplicacion = numeroUno * numeroDos;
            console.log(multiplicacion);
        } else {
            if (tipoOperacion == operacion04) {
                const numeroUnoString = prompt(" Ingrese valor uno ");
                const numeroDosString = prompt(" Ingrese valor dos ");
                const numeroUno = Number(numeroUnoString);
                const numeroDos = Number(numeroDosString);
                const division = numeroUno / numeroDos;
                console.log(division);
            } else {
                if (tipoOperacion == operacion05) {
                    const parteConstante = Number(4, 905);
                    const tiempoString = prompt("Ingrese el tiempo transcurrido ");
                    const tiempo = Number(tiempoString);
                    const desplazamiento = (parteConstante * tiempo * tiempo);
                    console.log(desplazamiento);
                } else {
                    console.log("math error");
                }
            }
        }
    }
}
