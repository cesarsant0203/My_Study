import socket
# declaramos el socket con su constructor que recibe la familia y el tipo
servidor_socket=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
#definimos un puerto por el cual nos comunicaremos
port = 2708
#Unimos al puerto y a la direccion ip del servidor
servidor_socket.bind(('127.0.0.1', port))
#ponemos al servidor en espera de un mensaje
servidor_socket.listen(5)

while True:
    print("El servidor esta esperando la conexion")
    cliente_socket,addr=servidor_socket.accept()
    print("El cliente se conecto por", addr)
    while True:
        #recibimos los datos enviados por el cliente
        data=cliente_socket.recv(1024)
        if not data or data.decode('utf-8')=='END':
            break
        #imprimimos los datos enviados por el cliente
        print("Recivido del cliente: %s"% data.decode("utf-8"))
        try:
            #enviamos el mensaje al cliente
            cliente_socket.send(bytes('Oye cliente','utf-8'))
        except KeyboardInterrupt:
            print("Salido por el usuario")
    cliente_socket.close()
servidor_socket.close()
