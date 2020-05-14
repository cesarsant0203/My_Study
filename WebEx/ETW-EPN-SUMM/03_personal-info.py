space=" "
def inputAge(message):
    while True:
        try:
            userAge = int(input(message))       
        except ValueError:
            print("Not an number! Try again.")
            continue
        else:
            return userAge 
        break 
 
idioma=input("select language spanish / english \n")
if idioma=="english":
    name=input("What is your first name? \n")
    lastName=input("What is your last name? \n")
    location=input("What is your location? \n")
    age=inputAge("What is your age? \n")
    age=str(age)
    print("Hi" + space + name + space + lastName + "!"
    + space + "Your location is" + space + location
    + space + "and you are"+ space + age + space +"years old." )
elif idioma=="spanish":
    name=input("Cual es tu nombre? \n")
    lastName=input("Cual es tu apellido? \n")
    location=input("Cual es tu ubicacion? \n")
    age=inputAge("Cual es tu edad? \n")
    age=str(age)
    print("Hola" + space + name + space + lastName + "!"
    + space + "Tu ubicacion es" + space + location
    + space + "y tu tienes"+ space + age + space +"anios." )
else:
    print("That is not a valid language.")

