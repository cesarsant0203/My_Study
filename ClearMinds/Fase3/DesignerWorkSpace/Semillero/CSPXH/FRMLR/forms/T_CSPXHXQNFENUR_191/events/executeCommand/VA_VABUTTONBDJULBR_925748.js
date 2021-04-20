

//Entity: Persona
//Persona. (Button) View: Bienvenida
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONBDJULBR_925748 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Persona.nombre = ""
    entities.Persona.apellido = null
    entities.Persona.nombreCompleto =""
};