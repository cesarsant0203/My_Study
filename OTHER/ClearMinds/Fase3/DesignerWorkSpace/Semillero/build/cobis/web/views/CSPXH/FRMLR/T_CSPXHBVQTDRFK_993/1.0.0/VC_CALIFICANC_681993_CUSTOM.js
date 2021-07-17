/* variables locales de T_CSPXHBVQTDRFK_993*/

(function (root, factory) {
    factory();
} (this, function() {

    "use strict";

    /*global designerEvents, console */

        //*********** COMENTARIOS DE AYUDA **************
        //  Para imprimir mensajes en consola
        //  console.log("executeCommand");

        //  Para enviar mensaje use
        //  eventArgs.commons.messageHandler.showMessagesInformation('Ejecutando comando personalizado');

        //  Para evitar que se continue con la validación a nivel de servidor
        //  eventArgs.commons.execServer = false;

        //**********************************************************
        //  Eventos de VISUAL ATTRIBUTES
        //**********************************************************

    
        var task = designerEvents.api.calificaciones;
    

    //"TaskId": "T_CSPXHBVQTDRFK_993"


    	

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



}));
