$marcas = [ "Mazda", "Audi", "Nissan", "Peugeot", "Citroen" ] #usar $ para especificar variables globales estar atento y recordar
def autos()
print "#{$marcas} \n"
print "1.Observar \n 2.Anadir o cambiar \n 3. Eliminar \n 4.Observar arreglo de autos \n E.Salir \n"
  operacion = gets.to_i
  if operacion == 1
  print "ingrese posicion de la marca a observar \n"
  puts $marcas[gets.to_i] # si 1 = Audi
  sleep(3) #puedo usar sleep para que la siguiente linea de codigo no salga enseguida, muy util.
  autos
  else
    if operacion == 2
    print "Ingrese la poscion del auto que desea anadir o cambiar \n"
    $marcas[gets.to_i] = "#{gets.chomp}"
    puts "este es su arreglo #{$marcas} \n"
    sleep(3)
    autos
    else
      if operacion == 3
      print "este es su arrwglo #{$marcas} \n"
      print "ingrese el elemento a eliminar \n"
      puts $marcas.delete_at(gets.to_i)
      puts "este es su arreglo #{$marcas} \n"
      sleep(3)
      autos
      else
        if operacion == 4
        puts "este es su arreglo #{$marcas} \n"
        sleep(5)
        autos
        else
          if operacion == 5
            puts "ADIOS, SEE YOU SOON \n (By Cesar Santacruz) \n"
          end
          print "no especificado \n"
          autos
        end
      end
    end
  end
end




def main()
  autos
end

puts "#{main()}"
