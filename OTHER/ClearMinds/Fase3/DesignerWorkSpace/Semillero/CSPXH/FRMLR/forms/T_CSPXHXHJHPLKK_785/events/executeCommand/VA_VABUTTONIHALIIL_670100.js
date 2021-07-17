

//Entity: Calculadora
//Calculadora. (Button) View: Calculadora
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONIHALIIL_670100 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = false;
    entities.Calculadora.resultado = entities.Calculadora.numero1 / entities.Calculadora.numero2;

};