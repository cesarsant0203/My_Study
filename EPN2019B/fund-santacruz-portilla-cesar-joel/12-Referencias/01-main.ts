function main(){
    let uno = 1;
    let dos = uno; // valor
    let tres = dos; //valor
    console.log('uno', uno);
    console.log('dos', dos);
    console.log('tres', tres);
    const arreglito = [1,2,3];
    let miOtroArreglito = [];
    let a = arreglito[0];
    let b = arreglito[1];
    console.log(arreglito);
    console.log('a',a);
    console.log('b',b);
    miOtroArreglito = [
        ...arreglito,
    ];
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
    console.log('a',a);
    console.log('b',b);
    console.log('mi otro arreglito', miOtroArreglito);

    let adrian = {
        id: 1,
        nombre: 'Adrian',
        sueldo: 1.12
    };
    const soloElNombre = adrian;
    const copUno = adrian;
    const copDos = adrian;
    const copTres = adrian;
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
