

//Entity: Notas
//Notas. (Button) View: Calificaciones
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONCBOIZEK_276190 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Notas.nota1 = "";
    entities.Notas.nota2 = "";
    entities.Notas.nota3 = "";
    entities.Notas.promedioNota = "";
};