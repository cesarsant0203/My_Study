var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
function main() {
    var uno = 1;
    var dos = uno; // valor
    var tres = dos; //valor
    console.log('uno', uno);
    console.log('dos', dos);
    console.log('tres', tres);
    var arreglito = [1, 2, 3];
    var miOtroArreglito = [];
    var a = arreglito[0];
    var b = arreglito[1];
    console.log(arreglito);
    console.log('a', a);
    console.log('b', b);
    miOtroArreglito = __spreadArrays(arreglito);
    //asignar a mi otro arreglito una nueva direccion de memoria
    // 1-> For llenamos un nuevo arreglo
    //2-> filter -> siempre true
    //3-> Map -> 
    //INMUTABILIDAD
    //CLON DEL ARREGLO-> trabajar trabajar
    miOtroArreglito.push(2);
    arreglito[0] = 9;
    arreglito[1] = 10;
    console.log('arreglito', arreglito);
    console.log('a', a);
    console.log('b', b);
    console.log('mi otro arreglito', miOtroArreglito);
    var adrian = {
        id: 1,
        nombre: 'Adrian',
        sueldo: 1.12
    };
    var soloElNombre = adrian;
    var copUno = adrian;
    var copDos = adrian;
    var copTres = adrian;
    console.log('adrian');
    console.log('solo el nombre', soloElNombre);
    delete adrian.nombre;
    soloElNombre['edad'] = 22;
    console.log('adrian');
    console.log('solo el nombre', soloElNombre);
    console.log('copUno', copUno);
    console.log('copDos', copDos);
    console.log('copTres', copTres);
}
main();
//arreglo ibjhetos ({}) -> direccion de memroia
//primitivas hacen referencia al valor
