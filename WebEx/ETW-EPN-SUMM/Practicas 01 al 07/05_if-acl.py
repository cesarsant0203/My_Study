def inputNum(message):
    while True:
        try:
            userNum = int(input(message))       
        except ValueError:
            print("Not an number! Try again.")
            continue
        else:
            return userNum 
        break 
aclNum = inputNum("What is the IPv4 ACL number? ")
if aclNum >= 1 and aclNum <= 99:
 print("This is a standard IPv4 ACL.")
elif aclNum >=100 and aclNum <= 199:
 print("This is a extended IPv4 ACL.")
else:
 print("This is not a standard or extended IPv4 ACL.")
