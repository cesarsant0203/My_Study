/* variables locales de T_CSPXHXHJHPLKK_785*/

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

    
        var task = designerEvents.api.calculadora;
    

    //"TaskId": "T_CSPXHXHJHPLKK_785"


    	

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONBBITWWY_437100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.resultado = entities.Calculadora.numero1 + entities.Calculadora.numero2;

};

	

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONIADKUBQ_455100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.resultado = entities.Calculadora.numero1 * entities.Calculadora.numero2;

};

	

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONIHALIIL_670100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.resultado = entities.Calculadora.numero1 / entities.Calculadora.numero2;

};

	

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONRCKITDC_291100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.numero1 = "";
    entities.Calculadora.numero2 = "";
    entities.Calculadora.numero3 = "";
    entities.Calculadora.resultado = "";

};

	

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONSGXGXHA_648100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.resultado = entities.Calculadora.numero1 - entities.Calculadora.numero2;

};



}));
