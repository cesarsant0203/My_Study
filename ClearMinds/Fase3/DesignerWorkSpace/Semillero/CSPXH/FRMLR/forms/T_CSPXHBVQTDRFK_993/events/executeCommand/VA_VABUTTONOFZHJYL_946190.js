

//Entity: Notas
//Notas. (Button) View: Calificaciones
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONOFZHJYL_946190 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    if(entities.Notas.nota2 != null || entities.Notas.nota2 != "" || entities.Notas.nota2 != 0.00 || entities.Notas.nota2 != 0){
        entities.Notas.promedioNota = (entities.Notas.nota1 + entities.Notas.nota2 + entities.Notas.nota3)/3
            alert("Successfully calculated grades");
       } else {
            alert("Calificaciones no calculadas con exito");
            entities.Notas.promedioNota = "";
       }
    
};