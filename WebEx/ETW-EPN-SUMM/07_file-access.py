devices=[]
file=open("devices.txt","r")
for item in file:
    #stip para remover espaacios
    item=item.strip()
    devices.append(item)
#ocupo para imprimir for item
#   print(item)

file.close()
#puedo usar para imprimir dentro de una lista
print(devices)
