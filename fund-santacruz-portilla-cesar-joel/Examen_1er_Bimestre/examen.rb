=begin
primero debemos definir todas las
funciones que estaremos usando para poder generar
la calculadora
=end
def sumar(numuno, numdos, numtres, numcuatro, numcinco)
  numuno + numdos + numtres + numcuatro + numcinco
end

def restar(numuno, numdos)
  numuno - numdos
end

def multiplicar(numuno, numdos)
  numuno * numdos
end

def dividir(numuno, numdos)
  numuno / numdos
end

def potencia(numuno)
  numuno * numuno
end

def area_circunferencia(numuno)
  3.1415 * (numuno ** 2)
end

def area_rectangulo(numuno, numdos)
  numuno * numdos
end

def area_triangulo(numuno, numdos)
  (numuno * numdos) / 2
end

def volumen_esfera(numuno)
  3.1415  * (numuno * numuno * numuno) * 1.3333
end

def borracho(numuno, numdos)
  numuno / (numdos * 1.7)
end
=begin
Luego de definir todas las operaciones que realizara
la calculadora, lo siguiente a hacer es definir
como tal la funcion de la calculadora
=end
def calculadora()
  print " 1.Suma \n 2.Resta \n 3.Multiplicacion \n 4.Division \n 5.Potencia \n 6.Area circunferencia \n 7.Area rectangulo \n 8.Area triangulo \n 9.Volumen esfera \n 10. % Alcohol en la sangre \n 11.Amor de ella hacia ti \n 12.Salir \n Escoja la operacion deseada de la lista de arriba: \n"
  operacion = gets.to_i
  if operacion == 1
    print "numero 1 \n"
    numuno = gets.to_i
    print "numero 2 \n"
    numdos = gets.to_i
    print "numero 3 \n"
    numtres = gets.to_i
    print "numero 4 \n"
    numcuatro = gets.to_i
    print "numero 5 \n"
    numcinco = gets.to_i
    puts "el resultado de la suma es #{sumar(numuno, numdos, numtres, numcuatro, numcinco)} \n"
    sleep(4)
    calculadora
  else
    if operacion == 2
      print "numero 1 \n"
      numuno = gets.to_i
      print "numero 2 \n"
      numdos = gets.to_i
      puts "el resultado de la resta es #{restar(numuno, numdos)} \n"
      sleep(4)
      calculadora
    else
      if operacion == 3
        print "numero1 \n"
        numuno = gets.to_i
        print "numero2 \n"
        numdos = gets.to_i
        puts "el resultado de la multiplicacion es #{multiplicar(numuno, numdos)} \n"
        sleep(4)
        calculadora
      else
        if operacion == 4
          print "numero 1 \n"
          numuno = gets.to_i
          print "numero 2 \n"
          numdos = gets.to_i
          puts "el resultado de la division es #{dividir(numuno, numdos)} \n"
          sleep(4)
          calculadora
        else
          if operacion == 5
            print "numero1 \n"
            numuno = gets.to_i
            puts "el resultado de la potencia es #{potencia(numuno)} \n"
            sleep(4)
            calculadora
          else
            if operacion == 6
              print "radio \n"
              numuno = gets.to_i
              puts "el area de la circunferencia es #{area_circunferencia(numuno)} \n"
              sleep(4)
              calculadora
            else
              if operacion == 7
                print "base \n"
                numuno = gets.to_i
                print "altura \n"
                numdos = gets.to_i
                puts "el area del rectangulo es #{area_rectangulo(numuno, numdos)} \n"
                sleep(4)
                calculadora
              else
                if operacion == 8
                  print "base \n"
                  numuno = gets.to_i
                  print "altura \n"
                  numdos = gets.to_i
                  puts "el area del triangulo es #{area_triangulo(numuno, numdos)} \n"
                  sleep(4)
                  calculadora
                else
                  if operacion == 9
                    print "radio \n"
                    numuno = gets.to_i
                    puts "el volumen de la esfera de radio #{numuno} es #{volumen_esfera(numuno)} \n"
                    sleep(4)
                    calculadora
                  else
                    if operacion == 10
                      print "gr de alcohol puro ingeridos \n (% por volumen total) \n"
                      numuno = gets.to_i
                      print "peso en kg de quien consume \n"
                      numdos = gets.to_i
                      puts "Porcentaje de alcohol en la sangre es #{borracho(numuno, numdos)} \n"
                      sleep(4)
                      calculadora
                    else
                      if operacion == 11
                        print "Ingrese su cantidad de amor hacia ella 1 AL 100 \n"
                        numuno = gets.to_i
                        puts "No importa que la quieras #{numuno} de 100 ella nunca te va amar \n"
                        sleep(4)
                        calculadora
                        else
                          if operacion == 12
                             print "ADIOS, SEE YOU SOON \n (By: Cesar Santacruz) \n"
                          else
                          end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

def main()
  calculadora
end
puts "#{main()}"
