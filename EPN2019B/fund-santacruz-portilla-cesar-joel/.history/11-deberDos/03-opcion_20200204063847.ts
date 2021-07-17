
export async function funcionOpcion(){
const opcion =
    {
        type:'number',
        name:'numeroDeOpcion',
        message:'¿Que desea realizar?',
        validate: value => (value < 0 || value > 99) ? `ESCOGER SOLO DE ENTRE LAS OPCIONES POSIBLES`:true
    }
    const opcionRespuesta:opcionInterface = await prompts(opcion);
    return opcionRespuesta.numeroDeOpcion;
}
