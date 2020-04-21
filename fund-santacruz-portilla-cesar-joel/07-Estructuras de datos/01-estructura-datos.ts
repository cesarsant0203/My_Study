
/*
persona
animal -> nombre cientifico, color principal
    fecha de nacimiento, peso, genero, altura
casi en todos los lenguajes se usa un
struct -> estructura de datos
classe -> estructura de datos -> metodos!
"llave":"valor"
no importa si se pone la ultima coma
en los json no se podia guardar datos undefined pero aqui si
'nombreCientifico': 'canis lupus familiaris',
    noEsNecesario: true,
    enojo: undefined,
    edadActual: edad //variables
    a cualquier propiedad de la estruct se la puede poner "null", esto en javascript
    dentro de una estructura de datos podemos definir con tipos de datos primitivos y con tipos de datos de estructura de datos, ademas pueden ser opcionales o requeridos
*/
import {AnimalPerrito} from './interfaces/animal-perrito.interface';
import {Duenio} from './interfaces/duenio.interface';


const poliPerro = {
    nombreCientifico: 'canis lupus familiaris',
    nombre: 'grandote',
    clan: 'poliperro',
    edad: 10,
    hijos: null,
    perritas: [ 'Manuela' , 'zodaira'],
    vacunado: true,
}
console.log(poliPerro.nombre); //canis lupus familiaris

const poliPerroAmarillo: AnimalPerrito = {
    nombreCientifico: 'canis lupus familiaris',
    nombre: 'grandote',
    clan: 'poliperro',
    edad: 4,
    hijos: null,
    perritas: [],
    vacunado: false,
}
console.log(poliPerroAmarillo);

const duenioPoliPerroAmarillo: Duenio = {
    nombres: 'Cesar',
    apellidos: '',
    cedula: 1723521017,
    fechaNacimiento: 2,
    mascotasPerros: [poliPerroAmarillo]
}
poliPerroAmarillo.duenio = duenioPoliPerroAmarillo;
poliPerroAmarillo.edad = 4;

//Acceder a los datos
console.log(poliPerroAmarillo.duenio.nombres);
console.log(poliPerroAmarillo.duenio.apellidos);
console.log(poliPerroAmarillo.edad);
