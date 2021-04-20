/* variables locales de T_CSPXHXQNFENUR_191*/

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

    
        var task = designerEvents.api.bienvenida;
    

    //"TaskId": "T_CSPXHXQNFENUR_191"


    	

//Entity: Persona
//Persona. (Button) View: Bienvenida
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONUJRFRKO_639748 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    console.log("Bienvenidos a designer")
    entities.Persona.nombreCompleto = entities.Persona.nombre+" "+entities.Persona.apellido
};



}));
