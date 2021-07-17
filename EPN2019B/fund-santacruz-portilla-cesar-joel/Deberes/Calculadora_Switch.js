var tipoOperacion = prompt(" Ingrese operacion a realizar ");
switch (tipoOperacion) {
    case "suma":
        var numeroUnoString = prompt(" Ingrese valor uno ");
        var numeroDosString = prompt(" Ingrese valor dos ");
        var numeroUno = Number(numeroUnoString);
        var numeroDos = Number(numeroDosString);
        var suma = numeroUno + numeroDos;
        console.log(suma);
        break;
    case "resta":
        var numeroTresString = prompt(" Ingrese valor uno ");
        var numeroCuatroString = prompt(" Ingrese valor dos ");
        var numeroTres = Number(numeroTresString);
        var numeroCuatro = Number(numeroCuatroString);
        var resta = numeroUno - numeroDos;
        console.log(resta);
        break;
    case "multiplicacion":
        var numeroCincoString = prompt(" Ingrese valor uno ");
        var numeroSeisString = prompt(" Ingrese valor dos ");
        var numeroCinco = Number(numeroCincoString);
        var numeroSeis = Number(numeroSeisString);
        var multiplicacion = numeroUno * numeroDos;
        console.log(multiplicacion);
        break;
    case "division":
        var numeroSieteString = prompt(" Ingrese valor uno ");
        var numeroOchoString = prompt(" Ingrese valor dos ");
        var numeroSiete = Number(numeroSieteString);
        var numeroOcho = Number(numeroOchoString);
        var division = numeroUno / numeroDos;
        console.log(division);
        break;
    case "desplazamiento":
        var parteConstante = Number(4.905);
        var tiempoString = prompt("Ingrese el tiempo transcurrido ");
        var tiempo = Number(tiempoString);
        var desplazamiento = (parteConstante * tiempo * tiempo);
        console.log(desplazamiento);
        break;
    default:
        console.log("math error");
}
