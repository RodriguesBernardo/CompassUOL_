animais = [
    'Cachorro', 'Gato', 'Arara', 'Baleia', 'Tigre', 'Girafa',
    'Zebra', 'Galo', 'Foca', 'Panda', 'Cavalo', 'Coelho',
    'Elefante', 'Coruja', 'Cobra', 'Macaco', 'Lobo', 'Urso',
    'Pato', 'Leao', 'Hipopotamo'
]
animais.sort()
for animal in animais:
    print(animais)


with open('animais.csv','w') as arquivo:
    for animal in animais:
        arquivo.write(f'{animal}\n')

