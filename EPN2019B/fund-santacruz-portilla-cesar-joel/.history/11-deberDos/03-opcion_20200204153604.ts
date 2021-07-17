import * as prompts from "prompts"
import { opcionInterface } from './interfaces/opcion.interface';

export async function funcionOpcion(){
const opcion =
    {
        type:'number',
        name:'numeroDeOpcion',
        message:'MOVE',
        validate: value => (value < 0 || value > 99) ? `ESCOGER SOLO DE ENTRE LAS OPCIONES POSIBLES`:true
    }
    const opcionRespuesta:opcionInterface = await prompts(opcion);
    return opcionRespuesta.numeroDeOpcion;
}
