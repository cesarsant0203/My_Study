import {Duenio} from './duenio.interface';
export interface  AnimalPerrito { // interface -> definimos una estructura
    nombreCientifico: string;
    nombre: string;
    clan: string;
    edad?: number;//opcionales
    hijos: object | string;
    perritas?: string[];//opcionales
    vacunado?: boolean;// opcionales
    duenio?: Duenio;
}