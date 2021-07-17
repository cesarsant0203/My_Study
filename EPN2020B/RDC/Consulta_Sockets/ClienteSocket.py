import socket
# declaramos el socket con su constructor que recibe la familia y el tipo
cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#definimos un puerto por el cual nos comunicaremos.
port = 2708
#realizamos la conexion al puerto y direccion.
cliente_socket.connect(('127.0.0.1', port))
#mensaje que se enviara al servidor
mensaje='Oye Servidor'

try:
    while True:
        #envia el mensaje al servidor en formato utf-8
        cliente_socket.send(mensaje.encode('utf-8'))
        #recibimos los datos enviados por el servidor
        data=cliente_socket.recv(1024)
        #imprimimos los datos enviados por el servidor
        print(str(data))
        more=input('Quiere enviar mas informacion al servidor?\n')
        #esperemos la respuesta afirmativa para mantener la conexion
        #caso contrario se cierra
        if more.lower() == 's' or more.lower() == 'si':
            mensaje=input("Ingrese el mensaje")
        else:
            break
except KeyboardInterrupt:
    print("Cerrado por el usuario")
cliente_socket.close()
