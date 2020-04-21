
export async function iniciar(){
            const arregloPreguntas = [
                {
                    type: 'text',
                    name: 'nombre',
                    message: 'Ingresa tu marca'
                },
                {
                    type: 'text',
                    name: 'modelo',
                    message: 'Ingresa tu modelo'
                },
                {
                    type: 'number',
                    name: 'anio',
                    message: 'Ingresa tu anio'
                },
                {
                    type: 'text',
                    name: 'origen',
                    message: 'Ingresa tu origen'
                },
                {
                    type: 'number',
                    name: 'precio',
                    message: 'Ingresa tu precio'
                }
            ];

        return arregloPreguntas
}