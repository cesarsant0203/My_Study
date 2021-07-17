const  tipoOperacion  =  prompt ( " Ingrese operacion a realizar " );
switch(tipoOperacion){
    case "suma":
        const numeroUnoString = prompt(" Ingrese valor uno ");
        const numeroDosString = prompt(" Ingrese valor dos ");
        const numeroUno = Number(numeroUnoString);
        const numeroDos = Number(numeroDosString);
        const suma = numeroUno + numeroDos;
        console.log(suma);
        break;
    case "resta":
        const numeroTresString = prompt(" Ingrese valor uno ");
        const numeroCuatroString = prompt(" Ingrese valor dos ");
        const numeroTres = Number(numeroTresString);
        const numeroCuatro = Number(numeroCuatroString);
        const resta = numeroUno - numeroDos;
        console.log(resta);
        break;
    case "multiplicacion":
        const numeroCincoString = prompt(" Ingrese valor uno ");
        const numeroSeisString = prompt(" Ingrese valor dos ");
        const numeroCinco = Number(numeroCincoString);
        const numeroSeis = Number(numeroSeisString);
        const multiplicacion = numeroUno * numeroDos;
        console.log(multiplicacion);
        break;
    case "division":
        const numeroSieteString = prompt(" Ingrese valor uno ");
        const numeroOchoString = prompt(" Ingrese valor dos ");
        const numeroSiete = Number(numeroSieteString);
        const numeroOcho = Number(numeroOchoString);
        const division = numeroUno / numeroDos;
        console.log(division);
        break;
    case "desplazamiento":
        const parteConstante = Number(4.905);
        const tiempoString = prompt("Ingrese el tiempo transcurrido ");
        const tiempo = Number(tiempoString);
        const desplazamiento = (parteConstante * tiempo * tiempo);
        console.log(desplazamiento);
        break;
    default:
            console.log("math error");
}