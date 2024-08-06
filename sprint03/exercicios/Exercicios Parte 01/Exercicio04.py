
numeros = list(range(1, 101))

for numero in numeros:
    if numero > 1:  
        primo = True
        for i in range(2, int(numero**0.5) + 1):
            if numero % i == 0:
                primo = False
                break
        if primo:
            print(numero)
