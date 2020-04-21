const tipoConcesionario = prompt("ingrese su auto deseado \n i10 \n spark \n picanto \n cerato \n rio \n aveo \n tucson \n tucsonix \n grandvitara \n f150 \n hylux \n bt50 \n mercedes \n alpha&romeo \n audi");
const auto01 = "i10";
const auto02 = "spark";
const auto03 = "picanto";
const auto04 = "cerato";
const auto05 = "rio";
const auto06 = "aveo";
const auto07 = "tucson";
const auto08 = "tucsonix";
const auto09 = "grandvitara";
const auto10 = "f150";
const auto11 = "hylux";
const auto12 = "bt50";
const auto13 = "mercedes";
const auto14 = "alpha&romeo";
const auto15 = "audi";
switch (tipoConcesionario) {
  case auto01:
  case auto02:
  case auto03:
    alert('El precio de estos autos estara al rededor de los 13000 $. \n Estos autos tienen suficiente espacio \n y son bastante comodos para parejas o estudiantes recien graduados');
    break;
  case auto04:
  case auto05:
  case auto06:
    alert("El precio de estos autos estara al rededor de los 17000 $. \n Estos autos son bastantes amplios \n y cuentan con bastante espacio en la cajuela");
    break;
  case auto07:
  case auto08:
  case auto09:
    alert('El precio de estos autos estara al rededor de los 24000 $. \n Estos SUV son increibles para cualquier familia \n vale la pena todos los gastos');
    break;
  case auto10:
  case auto11:
  case auto12:
    alert('El precio de estos autos estara al rededor de los 29000 $. \n Estas camionetas son las mejores en sus gamas \n y son bastante comodos para viajes largos');
    break;
  case auto13:
  case auto14:
  case auto15:
    alert('El precio de estos autos estara al rededor de los 40000 $. \n Si le sobra el dinero para gastar pues comprelo');
  default:
    alert('tu carro ' + tipoConcesionario + ' no debe ser nada bueno.');
}