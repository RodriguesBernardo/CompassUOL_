def calcular_valor_maximo(operadores, operandos):
    def aplicar_operacao(op, x, y):
        if op == '+':
            return x + y
        elif op == '-':
            return x - y
        elif op == '*':
            return x * y
        elif op == '/':
            return x / y
        elif op == '%':
            return x % y
        else:
            raise ValueError(f"Operação {op} não suportada")

    resultados = map(lambda t: aplicar_operacao(t[0], t[1][0], t[1][1]), zip(operadores, operandos))
    return max(resultados)

operadores = ['+', '-', '*', '/', '+']
operandos  = [(3, 6), (-7, 4.9), (8, -8), (10, 2), (8, 4)]

print(calcular_valor_maximo(operadores, operandos))  

