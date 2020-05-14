country = [ 
            "Brazil", 
            "Russia", 
            "India", 
            "China", 
            "South Africa"
          ]
capitals = {
    "Brazil": "Brasilia",
    "Russia": "Moscow",
    "India": "New Delhi",
    "China": "Beijing",
    "South Africa": [
                        "Pretoria",
                        "Cape Town",
                        "Bloemfontein"
                    ]
           }

# Con esto imprimo las countries y capitals
print( country )
print( capitals )
#con esto imprimo la segunda capital de Africa,tomar en cuenta la syntax
#cosas pequenas alteran el resultado
"""
si quisiera imprimir convinaacion de string y numeros u otros usar
sttr()
"""
print( capitals["South Africa"][1] )
