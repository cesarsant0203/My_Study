file=open("devices.txt", "a")
while True:
    newItem=input("Enter device name: \n")
    if newItem =='exit' or newItem=='Exit':
        print("-----All Done!-----")
        break
    newItem = str(newItem)
    file.write("\n"+ newItem)