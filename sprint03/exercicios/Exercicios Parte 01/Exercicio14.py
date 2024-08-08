def imprimir_parametros(*args, **kwargs):
    print("Parâmetros não nomeados:")
    for arg in args:
        print(arg)
        
    print("\nParâmetros nomeados:")
    for key, value in kwargs.items():
        print(f"{key} = {value}")

imprimir_parametros(1, 3, 4, 'hello', parametro_nomeado='alguma coisa', x=20)
