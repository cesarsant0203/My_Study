

//Entity: Persona
//Persona. (Button) View: Bienvenida
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONUJRFRKO_639748 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    console.log("Bienvenidos a designer")
    entities.Persona.nombreCompleto = entities.Persona.nombre+" "+entities.Persona.apellido
};