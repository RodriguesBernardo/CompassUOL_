import csv

def process_line(line):
    nome = line[0]
    notas = list(map(int, line[1:]))
    notas.sort(reverse=True)
    top_three = notas[:3]
    media = round(sum(top_three) / len(top_three), 2)
    return (nome, top_three, media)


def generate_report(filename):
    with open(filename, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)
        processed_data = [process_line(row) for row in reader]


    sorted_data = sorted(processed_data, key=lambda x: x[0])


    for nome, top_three, media in sorted_data:
        if media.is_integer():
            print(f'Nome: {nome} Notas: {top_three} Média: {media:.1f}')
        else:
            print(f'Nome: {nome} Notas: {top_three} Média: {media:.2f}')

generate_report('estudantes.csv')
