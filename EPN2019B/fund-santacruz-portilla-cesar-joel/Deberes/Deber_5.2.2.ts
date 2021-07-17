const aptitud = prompt("ingrese su aptitud");
const aptitud01 = "iniciativa";
const aptitud02 = "creatividad";
const aptitud03 = "adaptabilidad";
switch (aptitud) {
  case 'iniciativa':
    console.log('Serias muy bueno para liderar un grupo de trabajo.');
    break;
  case 'creatividad':
      console.log("Puedes ser muy bueno para proponer ideas");
      break;
  case 'adaptabilidad':
    console.log('Te puede ayudar mucho cuando se te presenten situaciones nuevas');
    break;
  default:
    console.log('Tener la aptitud ' + aptitud + 'debe ser increible, pero aun no la reconocemos en este programa.');
}