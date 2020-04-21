import * as prompts from "prompts"
import { opcionInterface} from "../interfaces/opcion.interface"

/////////////////////////////////////
export async function funcionOpcion()
{
    const opcion =
    {
        type:'number',
        name:'numeroDeOpcion',
        message:'¿Que desea realizar?',
        validate: value => (value < 0 || value > 30) ? `ESCOGER SOLO DE ENTRE LAS OPCIONES QUE APARECEN EN PANTALLA`:true
    }
    const opcionRespuesta:opcionInterface = await prompts(opcion);
    return opcionRespuesta.numeroDeOpcion;
}
////////////////////////////////////