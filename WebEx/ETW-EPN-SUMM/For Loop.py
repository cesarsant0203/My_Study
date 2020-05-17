devices=["R1","R2","R3","S1","S2"]
switches=[]
for item in devices:
    #print(item)
    #if "R" in item:
        #print(item)
    if "S" in item:
        switches.append(item)
print(switches)