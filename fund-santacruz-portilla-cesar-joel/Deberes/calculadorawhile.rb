puts "Buenos dias a continuacion desea: \n sumar(1) \n restar(2) \n multiplicar(3) \n dividir(4) \n calcular distancia con MRUV[5]? Ingrese el numero de la operacion que quiere realizar"
inputOpcion  = gets.to_f
case inputOpcion
when 1,2,3,4
  puts "ingrese el numero 1"
  numeroUno = gets.chomp.to_f
  puts "ingrese el numero 2"
  numeroDos = gets.chomp.to_f
  case inputOpcion
  when 1
    suma = numeroUno + numeroDos
    puts "la suma #{numeroUno} + #{numeroDos} = " +suma.to_s
    gets
  when 2
    resta = numeroUno - numeroDos
    puts "la resta #{numeroUno} - #{numeroDos} = " +resta.to_s
    gets
  when 3
    multiplicacion = numeroUno * numeroDos
    puts "la multiplicacion #{numeroUno} * #{numeroDos} = " +multiplicacion.to_s
    gets
  when 4
    division = numeroUno / numeroDos
    puts "la division #{numeroUno} / #{numeroDos} = " +division.to_s
    gets
  else
    puts "opcion invalida"
    gets
  end
when 5
  puts "ingrese la velocidad inicial en metros sobre segundo"
  velocidadInicial = gets.chomp.to_f
  puts "ingrese la aceleracion en metros sobre segundo al cuadrado"
  aceleracion = gets.chomp.to_f
  puts "ingrese el tiempo en segundos"
  tiempo = gets.chomp.to_f
  distancia = velocidadInicial*tiempo + aceleracion*tiempo*tiempo/2
  puts "la distancia es: "+distancia.to_s+" metros"
  gets
else
  puts "opcion invalida"
  gets
  end